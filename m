Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0606247295
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 18:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426446; cv=none; b=PLHyiFU5p2mq13MPBR7JhuSVhoHIeALVzCnxEL9ckPoD6D1wqtsU3ApdrL1hssWxMfB6vzfsgZOKB5+kIreTb+QwnvLhpv4ejkUo5Wacb6KvYlY4/OBWH2a7K8ke91itl1iEW/M65ADUYOb6DbADg26x+eEHqeVnqdpaN3kxCP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426446; c=relaxed/simple;
	bh=cbyuGkfXpqUbhzcI1BkQa3K8cyZUe/N+4bGTpsNbH5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gfy6I9ZaBe98+VDX8ZlXQ5TeNc1jZGS9+kZjV9NGBc6/Cy2Ol6wpvnBDWU6sU5km9pZjKHTgAeYe6QW6QG9gyfdhYneDCtduBPHj871PhkOb4187RvK20c5ovXSh8SVve7T/AGMvVtP0YWOLUmUKx0IVs0h7JzLZEkabAZWtnHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpO35qJk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3FHLG6d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpO35qJk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3FHLG6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766426442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=;
	b=TpO35qJk4993rLDqjUjdhUf7crwbGJiwAtG3djDZvH2Yaw6FaKdzkhEExZClOqspUqcDeV
	fyPozRoteZQKhW6oF2hjwj5OWY/6B4cebANZhCzTkcde5UMfXho+KmpztpA4DlAl+89hwD
	rbmOLWDPupX4r5CAPPFo5Me6lB+DDQw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-cbdIaA90N62h0vgw_r073g-1; Mon, 22 Dec 2025 13:00:41 -0500
X-MC-Unique: cbdIaA90N62h0vgw_r073g-1
X-Mimecast-MFC-AGG-ID: cbdIaA90N62h0vgw_r073g_1766426441
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8887c0d3074so113712936d6.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766426441; x=1767031241; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=;
        b=c3FHLG6dt1utePC4BAhCOu9bsRZBsYxoAjdwgugSfG2kwnsR9xoQY2c8lm8j0YrcDy
         M+lX19ls1AlHMCcFSvHxmN/kcFgWd7SwRSVd1zydUqsiVTZaMKn0/FpQpUBXX1vWQw4S
         M6EfyBys6JvnnpynZbpenEdTazny5H+3wqe78ZD7tS9lpqpsWKv8JPlEXO+78QhPd+H5
         dfoSALSttX1C+oo+nbRg258lBYwWPT/zRcNhuuCCf8HNOZqgnCN/+s/RX7088DKiIipn
         kLPso4ZirxBnefCbTOV3GFWgojQWRrfEQ92GtDGfz7M1Ni2zO6xZGNq6mQpGtaSuVHbM
         tFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766426441; x=1767031241;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=;
        b=ZHfK01puoFp6+ikcW/DkDjssXiYilX7GapO+yOWqai5ZBd3hoszWXMJ+YAIxlHOeV8
         wc+2AxkHeVMVrBQvIvULlGz4SRf/kRfRKfcMSs/5Fa7WqZ9Yfi4fLkQd7nSQ/wqyl+0r
         lBiesDJpaDMFdr8yMEXg74cTwoPHbeuVU1msBLZyarSlcFOTPeMzlXWgTvipknV6XdPb
         4ENz5JdqmMOqURd7Qo9jDDjOHtnJO55sTExo+lrUE8maHoOG2J8LTcIzNIEq93wEW1Yf
         T0AUrf7wh4sW79qDDiG7eiO7n4sYOCtG5e6cJYEDlDfgQPZxPR2/5u8fMTx0vhuWoffU
         YSyw==
X-Forwarded-Encrypted: i=1; AJvYcCWjigut8VGl8oToAMs9yhjgIVX6au34BA9vlToKhbsHeQT0+7s4x6s4OM9ejGABF8a1/as6JLLRr7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+dnd5t1SlbacHZvcllvzZlk6gEG1t6Sfjl2UsYnqdXamlwXh
	6sas2D25uUrFHn7yaZHLcmWp/RjRr9XU4iwsUryURSXwGo6wX/5N4EEjBnkN14+17dxsjEuNiun
	MJeRwSU5Ek52CMExkDqN0YpR69+RidmD5ybNw0L7SihtBBpK3/iO5+UsMu2lsYA==
X-Gm-Gg: AY/fxX6beal1g3dz1Syk6Ki4o7Rmn10STN5kDErCqmjVs9Ag04UlktzAfu8ehvzBZCN
	uxDAgVX5CfIDWJkfaitqPJsTCS3zfEapmnfj9aZqki83GaS1uNFM1I8CBz36ijqJP1POtYC6RZT
	GuJg/KR7R6c292AJpbgp2iwFvwNkE37Fx7rH4Ae5wIeYOIL8YMA0uCea5aCEQcragN/30HroIDa
	8Xc4RNfkeIle1hEpmALCvejznYCFSBwGRbojCQF8os+ApwdLxvBYgx/EzTP1eIo49B5IShDmnSp
	K3+/tWU0jjSiCNqjhFMLnS/eEdfK9wcNbMVJgJMIwM2vwB5PLFJKR0eAfgbkEeq+lkMECASdY52
	Jb0EraZ3vYYV0leN3LUb02YshsekBJL0d3H9GuivcQxYl
X-Received: by 2002:a05:6214:27c6:b0:88a:306b:820b with SMTP id 6a1803df08f44-88d83d670e7mr209995366d6.57.1766426440659;
        Mon, 22 Dec 2025 10:00:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFShBd6/ILCtyh9OhdnIzWfY3dp9JmiO74dGqZBOXDUCJ4lowAybkSiEsS44d+2GsPo84wwMA==
X-Received: by 2002:a05:6214:27c6:b0:88a:306b:820b with SMTP id 6a1803df08f44-88d83d670e7mr209994116d6.57.1766426440046;
        Mon, 22 Dec 2025 10:00:40 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a63e296sm86625536d6.52.2025.12.22.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:00:39 -0800 (PST)
Date: Mon, 22 Dec 2025 13:00:36 -0500
From: Brian Masney <bmasney@redhat.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v4 04/21] clk: mediatek: Add MT8189 apmixedsys clock
 support
Message-ID: <aUmHRCXNy45PrVLG@redhat.com>
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
 <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Dec 15, 2025 at 11:49:13AM +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |  13 ++
>  drivers/clk/mediatek/Makefile                |   1 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c | 192 +++++++++++++++++++
                        ^^^^^^^^^^^^^^^^^^^^^^^

This file, along with others in this series, is not listed in
MAINTAINERS. This is the current entry:

MEDIATEK MT6735 CLOCK & RESET DRIVERS
M:      Yassine Oudjana <y.oudjana@protonmail.com>
L:      linux-clk@vger.kernel.org
L:      linux-mediatek@lists.infradead.org (moderated for non-subscribers)
S:      Maintained
F:      drivers/clk/mediatek/clk-mt6735-apmixedsys.c
F:      drivers/clk/mediatek/clk-mt6735-imgsys.c
F:      drivers/clk/mediatek/clk-mt6735-infracfg.c
F:      drivers/clk/mediatek/clk-mt6735-mfgcfg.c
F:      drivers/clk/mediatek/clk-mt6735-pericfg.c
F:      drivers/clk/mediatek/clk-mt6735-topckgen.c
F:      drivers/clk/mediatek/clk-mt6735-vdecsys.c
F:      drivers/clk/mediatek/clk-mt6735-vencsys.c
F:      include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-imgsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-infracfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-pericfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-topckgen.h
F:      include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-vencsys.h
F:      include/dt-bindings/reset/mediatek,mt6735-infracfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-pericfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-vdecsys.h

Should the entries to MAINTAINERS be simplified to the following?

F:      drivers/clk/mediatek/
F:      include/dt-bindings/clock/mediatek,*

Brian

