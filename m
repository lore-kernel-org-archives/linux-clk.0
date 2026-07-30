Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91E446826
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429318; cv=none; b=QkJZ1ra+0KNqwwnJgKDtO9cm3N8JT6taQr5SPwjFp81wWlmkszL/A6uYYTgskgZiWYkakDwCfgi+O5czs8vLiv8wxT6Fw4byfpxYFT7ahOmAnbUubY9815EatOJbNEr02SototSPAbDdCSJ4sUhKH1v4gkl1Tp0y33wtLDv+V/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429318; c=relaxed/simple;
	bh=IQQ9nUJIesZZcmOoIYOVxVaJ/DUB3Q/ehc5Ru15VyUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmSuLt0tT/Em+QFPaFh2v/0NhN/g0gqtSzx5+gbsBx55KYvLg0vCgBKx0UiazYBzH3efKLLPA9Bz/C+CapZ9QUjkk08gavyuYFIiFMx6br8ny2w5w/Qu75F1hJr2JFnMxOE9jr25a1gNKvgSIDvqVnD1fAMkNjZaqp/nox/JKPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ku+djM+1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PttX6h/G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ku+djM+1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PttX6h/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
	b=Ku+djM+1VhpqvtY3FbrKtMRKOtO0ZPfEFSruzRRzEgQtPgAmA81jC8UwPea+kjX9IXvOwG
	VGALwdk2fk0rAG/vOU1FvHPlz9FEwLJcjUgUucawWTdxKip+ROr9towZminONhSsCPhsQn
	m3YhDoil8WFd7KoPoW+OMBFlZ7rweCg=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-QL8e2vvVO7KE_6p_zW5W3A-1; Thu, 30 Jul 2026 12:35:13 -0400
X-MC-Unique: QL8e2vvVO7KE_6p_zW5W3A-1
X-Mimecast-MFC-AGG-ID: QL8e2vvVO7KE_6p_zW5W3A_1785429313
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-668910ff32bso5084192d50.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429313; x=1786034113; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
        b=PttX6h/GTL10hk5aZjScDAHpnx5qaR/EkFhtxzRqW3Ev8/uFSHnL2oj4w02RMGF/WB
         L4wowdobNU1eKw+VpB2Vr6PyOUTHJ/n+4ITRm5N3mn3sTL6+HLQJJUJv7CJyj56O7NYD
         3Ae58pPE1o0X/VPR+jwrSlSXkmuh9MAO4Zn9tVxDEfgc59cKIFg1YK7DBpV8v3jBEOWa
         U3mmOgeFNrGz7eQAUokZrm470o1ui4g3lMl0nOd9U9ZPQGRI45pheJ9HaPdkRCWtUDuZ
         LBey1vgLLNa2xIbBSEBG5u07TdzPnDtTquqXUfNN5pn6BYbBgRcIp3s4L06zvAeNwTcC
         yZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429313; x=1786034113;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
        b=DJxrBlvIMFVm0jHcjc7jyVVhNHJRTTVa0NGNOkcZt6NvQ30mEus50tdId8AkyygFee
         rKEfqKlWWLNSU/0DtSVAhyjLclag2Nr5LssEvGWYhDjlW5JrGJWC8sdDymyeuQE1I/Nf
         nbiQHqJfIAGqJCVnvaDMMrmf6eHXin6noCuZO33R7cKwh3/xKh9b8o8pVVrKSZPFKqJA
         RygJbDdlJanbxu4362WAai0H3f/GLzT1OlaaxBqSWK5tAUjOYyncih6mG8xkzWSlYF7z
         qDYqEBI7wV/fC8Dv/WPkVv31V4NxkF94+XzV5WrI6XZyagfhR6AuNFMWkvzC1IodiO7Z
         tfGg==
X-Forwarded-Encrypted: i=1; AHgh+RrwFM9P5LNTx63BFhlXlOX5zm+tdbHCgPKABvynB7PobeC3wSDJGEr3lcVNxDPi8oX2XdiqKxE0r64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYjrva/VQ2j0zn9TmAT0347eMcc+JzbHrLEUuNi5ikvYldUN4
	dNzKrgAtl2ZkWEZsH/HGQp48L25T0O7Dl8pNqNcJCTOi1CjEOQlRQt1slX5JopDX/FrXKEL/64M
	EgYnjs6352WWNBFOG3eIEOov/NsiARYmyerUyBOkPeFlYGgfuYaNxtPPYzpdCPA==
X-Gm-Gg: AR+sD11hkg0XQcO//s0NVtPxslGW4R+4KWNk01mMTO3nbrhJrInhaqwp8z/AOOu9M4v
	fcZLwmcpbsh7h+Cq1ONiq0nfnuYAYtnX0ReXEKFV6Mddf7DEGc4TdQCu/rbLeoZxrgklTKdIT6A
	mkIFlmwdo7GhluD0yVEY86nP1JEfURDzikqEgx/sVm8bUR9QoaYfkkatVQhSVLE7B6ROV420UbI
	+Z5IItu3vkltV0JRTkxETHZjEC2pFBCn9iaHLFwqhKLKaGE/EiXMx41LTDaVqktk1B3Q6lvtrJD
	/cPecHASZHc7UWOnGQVJieGaF7HUf2hGDH6MaLw18PVfkfLaBp/i11KkXb8j/+k6CB+t//ntNs3
	bfMKaHQsa7pwFz6hy69Q1bVJCSP5qO8ccDpQ=
X-Received: by 2002:a05:690e:484b:b0:668:2e27:22a7 with SMTP id 956f58d0204a3-6692f4d43c2mr1753672d50.33.1785429312995;
        Thu, 30 Jul 2026 09:35:12 -0700 (PDT)
X-Received: by 2002:a05:690e:484b:b0:668:2e27:22a7 with SMTP id 956f58d0204a3-6692f4d43c2mr1753652d50.33.1785429312567;
        Thu, 30 Jul 2026 09:35:12 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c734cfasm1633877d50.6.2026.07.30.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:11 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:35:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 06/11] clk: realtek: Add support for gate clock
Message-ID: <amt9Pby8K7w9Mxkw@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-7-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-7-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:28:01PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> for standard regmap gate clocks.
> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v11:
> - Add 'rtk_' prefix into struct names and function names.
> ---
>  drivers/clk/realtek/Makefile          |  1 +
>  drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 71edc18121c6..90c0658a83bf 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += freq_table.o
> +clk-rtk-y += clk-regmap-gate.o

Sort the list.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

