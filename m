Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35BB304BCE;
	Tue,  2 Sep 2025 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819069; cv=none; b=UKvjeEYNWvZUFaYHWSRyrjXB3jnZgfR6js94GUoB/Dx25bPiGnOnqZdxAKtccyZ5yzyyi0Ohz8weAruSO6l8EsbOC8bURGCC/LGEG2PUv+pfGmRgKWHD4Phx8F63yLcYKV1j1HIrQYb9vcrJo90lMhT+YODFnJw8R/JVZDN8HYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819069; c=relaxed/simple;
	bh=0sg61u0uyVCS9xwuRcskyxRu04POcVBwSj8TjqSmI18=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TrrxWWs1Vfrd/qzSOwmLO4ftL8DRG0rf5/+7dssOApmNZ/io/S75QuLFQyS+0uk6k/7iaC0muXn5ZcH3btvh4i87EniQVqdUeMQ9AD2yo7OlOoiQcXhASEzPBA2bXRU8pgWaZk0iYK1QPaRztkXFFrFTd4zYt8AnnHeULe/rk/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu4/Nfok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu4/Nfok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A10C4CEED;
	Tue,  2 Sep 2025 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819069;
	bh=0sg61u0uyVCS9xwuRcskyxRu04POcVBwSj8TjqSmI18=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eu4/NfokIPmUj2uB7t4VprquBt3vjrI0wae9I2ZQI00SsPUHBHNz23cJsd0bymBFg
	 hHyCjj3Iva60E7AS7VjfjTK/8D9TU3vppQW57Q+G7m7jV0Wr+ulPFSIIxBq6fP0MbI
	 +lq80DgsjmX/dAunD8spzyeeQo7QrNwbmR3AveXNoGGu9zUcXNDWGlolblVSRLB7sm
	 utNLlEkOw0iUvc6iSmjT5QIua4HmgZ/U0jDhZrA2SzqzLYMpTd43xHfqMllDbtPO7Z
	 jNTpQZY8hNwsAg1Do4c/ek+IL4eH1ekBhIJk5QK2moeb8MuIY0kuugqw3oH4ESKNCp
	 qXKjsVA+1ch1w==
Date: Tue, 02 Sep 2025 08:17:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: heiko@sntech.de, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org, 
 hjc@rock-chips.com
To: WeiHao Li <cn.liweihao@gmail.com>
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
Message-Id: <175678730903.877861.3501490977293619593.robh@kernel.org>
Subject: Re: [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368


On Sun, 31 Aug 2025 18:48:48 +0800, WeiHao Li wrote:
> This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> native display connectivity through the MIPI DSI host controller and
> PHY. The changes span multiple subsystems, including clock control,
> DRM/VOP integration, DSI controller binding, and PHY driver updates.
> 
> Key changes:
>   - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
>     phy initialization.
>   - Add missing lut_size of vop_data for RK3368.
>   - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
>     which is required for enabling the 24MHz reference clock.
>   - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
>     and register mappings.
> 
> These changes were tested on a RK3368-based board with a MIPI DSI
> panel [1]. The display boots successfully with console output.
> 
> [1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368
> 
> Tested-by: WeiHao Li <cn.liweihao@gmail.com>
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> 
> WeiHao Li (7):
>   drm/rockchip: dsi: Add support for RK3368
>   drm/rockchip: vop: add lut_size for RK3368 vop_data
>   dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
>   clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
>   ARM: dts: rockchip: Add display subsystem for RK3368
>   ARM: dts: rockchip: Add D-PHY for RK3368
>   ARM: dts: rockchip: Add DSI for RK3368
> 
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 79 +++++++++++++++++++
>  drivers/clk/rockchip/clk-rk3368.c             |  2 +-
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
>  include/dt-bindings/clock/rk3368-cru.h        |  1 +
>  5 files changed, 102 insertions(+), 1 deletion(-)
> 
> --
> 2.47.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250829 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250831104855.45883-1-cn.liweihao@gmail.com:

arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: vop@ff930000 (rockchip,rk3368-vop): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): $nodename:0: 'mipi-dsi@ff960000' does not match '^dsi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): compatible:0: 'rockchip,rk3368-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3128-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: /mipi-dsi@ff960000: failed to match any schema with compatible: ['rockchip,rk3368-mipi-dsi', 'snps,dw-mipi-dsi']
arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clock-names: ['ref', 'pclk', 'pclk_host'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clocks: [[10, 129], [10, 371], [10, 356]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-r88.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): reg: [[0, 4288053248, 0, 16384], [0, 4288020480, 0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: vop@ff930000 (rockchip,rk3368-vop): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): $nodename:0: 'mipi-dsi@ff960000' does not match '^dsi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): compatible:0: 'rockchip,rk3368-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3128-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: /mipi-dsi@ff960000: failed to match any schema with compatible: ['rockchip,rk3368-mipi-dsi', 'snps,dw-mipi-dsi']
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clock-names: ['ref', 'pclk', 'pclk_host'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clocks: [[10, 129], [10, 371], [10, 356]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): reg: [[0, 4288053248, 0, 16384], [0, 4288020480, 0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: vop@ff930000 (rockchip,rk3368-vop): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): $nodename:0: 'mipi-dsi@ff960000' does not match '^dsi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): compatible:0: 'rockchip,rk3368-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3128-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: /mipi-dsi@ff960000: failed to match any schema with compatible: ['rockchip,rk3368-mipi-dsi', 'snps,dw-mipi-dsi']
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: vop@ff930000 (rockchip,rk3368-vop): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clock-names: ['ref', 'pclk', 'pclk_host'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clocks: [[10, 129], [10, 371], [10, 356]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): reg: [[0, 4288053248, 0, 16384], [0, 4288020480, 0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): $nodename:0: 'mipi-dsi@ff960000' does not match '^dsi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): compatible:0: 'rockchip,rk3368-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3128-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: /mipi-dsi@ff960000: failed to match any schema with compatible: ['rockchip,rk3368-mipi-dsi', 'snps,dw-mipi-dsi']
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clock-names: ['ref', 'pclk', 'pclk_host'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clocks: [[11, 129], [11, 371], [11, 356]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): reg: [[0, 4288053248, 0, 16384], [0, 4288020480, 0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: vop@ff930000 (rockchip,rk3368-vop): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): $nodename:0: 'mipi-dsi@ff960000' does not match '^dsi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): compatible:0: 'rockchip,rk3368-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3128-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: /mipi-dsi@ff960000: failed to match any schema with compatible: ['rockchip,rk3368-mipi-dsi', 'snps,dw-mipi-dsi']
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clock-names: ['ref', 'pclk', 'pclk_host'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clocks: [[10, 129], [10, 371], [10, 356]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): reg: [[0, 4288053248, 0, 16384], [0, 4288020480, 0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: vop@ff930000 (rockchip,rk3368-vop): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): $nodename:0: 'mipi-dsi@ff960000' does not match '^dsi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): compatible:0: 'rockchip,rk3368-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3128-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: /mipi-dsi@ff960000: failed to match any schema with compatible: ['rockchip,rk3368-mipi-dsi', 'snps,dw-mipi-dsi']
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clock-names: ['ref', 'pclk', 'pclk_host'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clocks: [[10, 129], [10, 371], [10, 356]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): reg: [[0, 4288053248, 0, 16384], [0, 4288020480, 0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: vop@ff930000 (rockchip,rk3368-vop): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): $nodename:0: 'mipi-dsi@ff960000' does not match '^dsi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: mipi-dsi@ff960000 (rockchip,rk3368-mipi-dsi): compatible:0: 'rockchip,rk3368-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3128-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mipi-dsi@ff960000: failed to match any schema with compatible: ['rockchip,rk3368-mipi-dsi', 'snps,dw-mipi-dsi']
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clock-names: ['ref', 'pclk', 'pclk_host'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): clocks: [[11, 129], [11, 371], [11, 356]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#
arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: video-phy@ff968000 (rockchip,rk3368-dsi-dphy): reg: [[0, 4288053248, 0, 16384], [0, 4288020480, 0, 16384]] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,px30-dsi-dphy.yaml#





