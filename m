Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7074466B4C
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250388; cv=none; b=j/gEBJZ39y/m6AoEoyAXuERDJ3h3OHGB+fmEQcF5cVjuvlH6ksNPdTnzCt9rv2UpWIHRxWQddxfgc4eolmY4cl60GqehsQshJvqd2Gc0r2OC+EaSHDlF/V9o6g/y7Gnkr1eHBapnLouDnPrsn2zpeyllAYD7TdB0rAnue2F2hV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250388; c=relaxed/simple;
	bh=qoMJ7XfxQqje3odPmthF4AzsD2sC3sVDf+3wDtA5s0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awPorMb2E+WhtuVgGpekMM8Tjo1++7rUaNa+g3c1DFQGLONPbWRK9CSwqiVnYTQpLBhSAANkbrOivVdqYCJ2wJOQXLEXWnOnM9ONYDoXUcEywNJxZy4vJrUbzuzjh0Jv4CGThOZMe/8jjUhrhMNPnm1cZlBvt1jA1CxwDcjFXOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KzEE/soK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hsCWgm3Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KzEE/soK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hsCWgm3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785250386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=;
	b=KzEE/soKiBO3hp6/74Pol3eXbGyFMVKCr/ziZDw6Cg4i5NuaI7y22rkqVOehT0cbo/LRyw
	B7+3TsWZ7JnKTERWfhKOOWG5BUEh2aRcAsgv/XYV+9trigxawAxfwYw0fMrHpJ9ZSRrvuu
	ftl8+vAB3AOAhj3MjTyCDKOdWKZFTYw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-UO2ccbm8OZKFZ-6y4bRpSw-1; Tue, 28 Jul 2026 10:53:04 -0400
X-MC-Unique: UO2ccbm8OZKFZ-6y4bRpSw-1
X-Mimecast-MFC-AGG-ID: UO2ccbm8OZKFZ-6y4bRpSw_1785250384
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a098ea19so438582385a.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785250384; x=1785855184; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=;
        b=hsCWgm3QWWj9XFeZFvrbW0mZykxJwmARF9HDaC/prNxfer2Bc2N91VNSyWQ0lxBqTA
         fcHmpseJJvSn4g0Zr3XZvWTohrMKFJ1TiWi0i9f3niqA4/gM+jHquYq0FWxU0JrvXwpd
         R1yFhG5V+auwjyZl5Tc3ZxkTklsMKcOBtT9xA5Kl0t7E+q9sL5QHfAebret973awFj6W
         /AEmuheAaYSsxekkVnZroKRz/uPrE05VVBApEUEAAQWI1i+4FoJcS5GFtM0Cl/+D5JJU
         wwH3ZJ446EIeAFpwa7WkAGLceJ8KV2v8Vg8n0B82G+baqRDO8VmcH0EzsUQvsK/Z9tEC
         8rGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250384; x=1785855184;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=;
        b=N/+VgpC5wnW2IZf4CjECPGyusRE+Y3/tIkfEsmfRraxV/YUB51bsouJde2oZpx6kI6
         mspQYa9QKnZqlq5PFsc6PZaNVny0w/SNke/o3xqidwmU/ALOjNspisblvlLmM4HUDSKB
         B+d8pqspQNDNQWXvz7u4wX8Sod8hb8i39tRrkxUyAuEv9Q2c+m2B3oW0kf5wbTQTO5bC
         /BqkIJPNT6t9JNTKb/MPdkyVdcB5Kvel9SkmroDIMTT3WvhkSX+jr78Gvrzux7WCoOl+
         Q90BkVBBDPHia8ACRv3x5A3B85nJ+u0jOQOTWEOvTl5F4chjxhJFzhReIL9A89iDKaRy
         ryTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZzM6vRdJ4425ov3vj4/PA5f8k575lvkC1EhUhvSiTf6FWd/ba0Pv3zgFJnu/HeQixYqsIyiWct5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzQB/sgQYTGm/cuMlLu/yP+X6KY7p3jNQooVNqGKFNncq7HZg
	XGzBa4Ofm/xuyOfV4FsFXnBJqz+h7/oIlQpVwP6kGASOzdXGbxELxQNr01Rv/W8t//z5gw2af4V
	jej9rr9yGakUjJYP92zudbRvEbqfRqcSfv6+iKrO3IiASmcGUdZVvqO6ehcMPwQ==
X-Gm-Gg: AR+sD11X1FCFpl2+mbquDNNnHjyRd8tZYODQtXfBI9S53Ao5nx4wK/Q/My38NHQQsG2
	GaWqUqny6rxYYgCKudyrjlvG5AiUfiCKcObHpUBVDIyrtLVQtZ7m/I8r08+bYdPHA4b11HFJrU4
	t/gQs8ODaZTuxcRE7A4GEUpOQ7QfE20heRecEDgJUUGF8ktreqLfEEWRdauey40ARueCidoG574
	4s4XjU/d2ey/kGKDK40b3AVDK1ukz00VUsJ08UZ1wrCdZhwmUOnW4hA8ECjRAyR9SRrrfTBFI54
	tOws2a+clsaxcn4OMR/X5XD1CJ6B7/q1qTNLAWASRzoscA0MGhNoYUxsjCJj6HQ/3rmJmO2ItCp
	ideA7Mk5aUj8Q1uSayauSqOD+QsVstERT6nc=
X-Received: by 2002:a05:620a:2781:b0:92e:8ad6:210f with SMTP id af79cd13be357-93302640d97mr253740485a.8.1785250383720;
        Tue, 28 Jul 2026 07:53:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2781:b0:92e:8ad6:210f with SMTP id af79cd13be357-93302640d97mr253735385a.8.1785250383149;
        Tue, 28 Jul 2026 07:53:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de541ac8sm864956085a.16.2026.07.28.07.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:53:02 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:53:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <amjCTJguiANLY0vj@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707074839.240676-6-akkun11.open@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Akari,

On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
>  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> index d7d416172ab3..65dc4489a09c 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_ref2usb;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index fa2d1d557e04..8b69009e1965 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_clk_hw;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +

This patch doesn't compile.

    drivers/clk/mediatek/clk-mt8173-infracfg.c: In function ‘clk_mt8173_infracfg_probe’:
    drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: ‘clk_data’ undeclared (first use in this function); did you mean ‘clk_gate’?

Brian

