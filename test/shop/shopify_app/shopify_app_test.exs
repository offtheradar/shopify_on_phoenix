defmodule Shop.ShopifyAppTest do
  use Shop.DataCase

  alias Shop.ShopifyApp

  describe "shops" do
    alias Shop.ShopifyApp.Shop

    @valid_attrs %{shopify_domain: "some shopify_domain", shopify_token: "some shopify_token"}
    @update_attrs %{shopify_domain: "some updated shopify_domain", shopify_token: "some updated shopify_token"}
    @invalid_attrs %{shopify_domain: nil, shopify_token: nil}

    def shop_fixture(attrs \\ %{}) do
      {:ok, shop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ShopifyApp.create_shop()

      shop
    end

    test "list_shops/0 returns all shops" do
      shop = shop_fixture()
      assert ShopifyApp.list_shops() == [shop]
    end

    test "get_shop!/1 returns the shop with given id" do
      shop = shop_fixture()
      assert ShopifyApp.get_shop!(shop.id) == shop
    end

    test "create_shop/1 with valid data creates a shop" do
      assert {:ok, %Shop{} = shop} = ShopifyApp.create_shop(@valid_attrs)
      assert shop.shopify_domain == "some shopify_domain"
      assert shop.shopify_token == "some shopify_token"
    end

    test "create_shop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ShopifyApp.create_shop(@invalid_attrs)
    end

    test "update_shop/2 with valid data updates the shop" do
      shop = shop_fixture()
      assert {:ok, shop} = ShopifyApp.update_shop(shop, @update_attrs)
      assert %Shop{} = shop
      assert shop.shopify_domain == "some updated shopify_domain"
      assert shop.shopify_token == "some updated shopify_token"
    end

    test "update_shop/2 with invalid data returns error changeset" do
      shop = shop_fixture()
      assert {:error, %Ecto.Changeset{}} = ShopifyApp.update_shop(shop, @invalid_attrs)
      assert shop == ShopifyApp.get_shop!(shop.id)
    end

    test "delete_shop/1 deletes the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{}} = ShopifyApp.delete_shop(shop)
      assert_raise Ecto.NoResultsError, fn -> ShopifyApp.get_shop!(shop.id) end
    end

    test "change_shop/1 returns a shop changeset" do
      shop = shop_fixture()
      assert %Ecto.Changeset{} = ShopifyApp.change_shop(shop)
    end
  end
end
