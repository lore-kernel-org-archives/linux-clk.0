Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291457C9F;
	Fri, 28 Aug 2026 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925295; cv=none; b=gzUe0ngdgJ9FWjWC8y0hdlxDAiNk+Lv1yHitEMYEFnHhiExENO/SMjc+QeQ/YAzm5KVp9pDCqfO91KPz+Srtqxt+ApjrbYZbLD19gxgPrB4gDjjL4v7/XqGkMZbxMI9sTi4Oy37yW7BGaXXxXuLJ+QHnN3tGXn5cZUkATiC/YeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925295; c=relaxed/simple;
	bh=bcfqmGMeMqdMwd7GbULEUS9PCpiEtfMaEPGHMoIhPMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZnwVUc9X3efSgoLth2N2lCBV9KZn0zqJJQHpvXIc2yqFMxmGUh7Tnt1RrRKemG/n8JSzfraAK7HWDYB97i/Z5rYlGFK5Mr01jEhbIJaPIf4j8QQA9+cZ9A4U1G6EcPUY3/EWkuTP0wTFj3AHp1sh4+SSVaX4JiLF5B4JFUiIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQh3BmR7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQh3BmR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0587F1F000E9;
	Fri, 28 Aug 2026 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925294;
	bh=96OwOsL1l2yAJqxPI/hni50q62ZN/A7zwClCByUvxj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQh3BmR7i4/ZES0gsv1LafLfH9c2er8iVEg/6p+fSwKDrC1wHW4lsurAnJ+C7ckpX
	 9B+YhVuCsdMF3gsiFkDuOXW+Sv/EVbbDmPmkyL9UNhH1LQVux4XerrjsXpqICNRre7
	 ocbKWaMarFJHTkp1RqGKPTOErLOOdY+Mpf07jhM9urWxQ4kcuE5Z2UAferRlqF3un8
	 PD5KKGn9apxYyjWVAD+ZybKVvkZgjwagM8DbPy3O+A9/Xx9RS4Pf+gVdAxzS1EFPaW
	 Mzvq+X73CGF+aVN4C9CwVTgCMq2OD6l/n18en0QYlvp/0VVdRm8fKI0veh0UYsl33v
	 qO4OBk7hN/wOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/15] drm/bridge: inno-hdmi: Allow the register map
 to come from a parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, lee@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260828-jh7110-clean-send-v2-5-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134822eucas1p15d7a98e2e05c51aaacaac5e946337d07@eucas1p1.samsung.com>
 <20260828-jh7110-clean-send-v2-5-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:54:53 +0000
Message-Id: <20260828135454.0587F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Uninitialized variable 'val' is returned if regmap_read() fails
--

commit a6bf796635499ff8cec94a1fb87f0e5e4fc66897
Author: Michal Wilczynski <m.wilczynski@samsung.com>

drm/bridge: inno-hdmi: Allow the register map to come from a parent

This commit updates the inno-hdmi driver to use a regmap supplied by the
parent device if available, falling back to mapping its own resource
otherwise. This allows sharing the register space on SoCs where the HDMI
controller does not exclusively own the register window.

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index 12fd208d5e852..ebc5093f13ac4 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c

[ ... ]

> @@ -470,11 +471,23 @@ static int inno_hdmi_find_phy_config(struct inno_hd=
mi *hdmi,
> =20
>  static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
>  {
> +	u32 val;
> +
> +	if (hdmi->regmap) {
> +		regmap_read(hdmi->regmap, offset * 4, &val);
> +		return val;

[Severity: Medium]
Does this return uninitialized stack memory if regmap_read() fails?

If regmap_read() fails (e.g., due to an out-of-bounds offset, disabled
clock, or other regmap configuration issues), it returns a negative error
code and does not populate val. The function appears to ignore the return
value and blindly returns the uninitialized stack variable. Callers that
use this value for hardware logic might behave erratically if random stack
data is interpreted as register contents.

> +	}
> +
>  	return readl_relaxed(hdmi->regs + (offset) * 0x04);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D5
