Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226A37FF54
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225323; cv=none; b=TxDEmolFpVngQ4M0D6UgoQ4Zh+TtD+pi77HGRq6+a0SwmkeUuO5G8+VM7Ce+3iSBgyjT3F2bC/g+EYiSvsBuftVO5rKoN8+4LfVobwbMEvTRCdkRu7Q5r53vEj3ITkIzFDZUG5zgUh+oZ+aZKzSIXK/WyGcww06V/jb5svFk8Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225323; c=relaxed/simple;
	bh=SRM7P0DVh8Y/9wPe/rOOybQ1B/N/vHxP3rylpmbDRRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tb+eMlQ7v1+7rJNrHC+gw1EsTq1oMeMRKQWu018kh5wVje5naXo3yrhyiZJs2DcPApFBEow0auGmL/U3SowzETqcMd2jGVxmm1vgzuU0kP5CivUn2J9xhUuORk8LHIBG/fkWrLdp9wVgkGsEMbOl1mwr6cK1TaDzd1yh7z0xyY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LzJ/QGD0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsiAnhkW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LzJ/QGD0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsiAnhkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782225321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=;
	b=LzJ/QGD0i8R3xtuesPFuQk+eHVzRO0se2rFMw1+oJcjVz3m6MmPTo3CQ4lEF/Swruu4KQf
	/cTymYN+vjqzn/nM92E+kFm4V/v3BZCWfIX/LhchC0nbGzG8WGGZN1XH6HfKrz1U0KPFDH
	+NKqrkq1w9ZA3fnDgVgI9tnh6/CIgVA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-hZ3RMvx8PyuJdEducwhCnA-1; Tue, 23 Jun 2026 10:35:17 -0400
X-MC-Unique: hZ3RMvx8PyuJdEducwhCnA-1
X-Mimecast-MFC-AGG-ID: hZ3RMvx8PyuJdEducwhCnA_1782225317
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51768072950so68296911cf.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782225317; x=1782830117; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=;
        b=gsiAnhkWvpBqzQH1MGFKdYzgJMjHWHy4B2N/mPokPV3RGgX+pC+VlZwZ9CAYnWX7RJ
         LFXEsQck9QUV/IqtbIXiEAnWKrSl2Z9+hzzpvo1qwNgb/bCQnRv4obO1tXMxyMm6NFhN
         iIIpswoAuAfkLFMip84M1AtveGlEoCvP7/QPOToNHdzmqHbTqLqsQ8xUDU8AScFum1ws
         EXU7NuqakEU9c7TmlaEE/t8wXkUYCmZsvBlX5hFm5TG+7xSwkXt4ATOjZymj4oA9AYqv
         AeRBtGayderSQyYlB1YFEnoN0ixDdRw5THjxvqb/Jbg9uFyyTwvJN3Ra96BkrDZsTTaT
         EYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225317; x=1782830117;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=;
        b=nC5VJSr+AwlQ91KCjWKSQXZvOHukmZZ4697WcrmQKlKqUUq4NJdLgyyorHHgr2I6U9
         2N2/gDW9Gw4o4+esq3gJ7i4ya2A8y+PsGYINP/0BkxjoVVM3nOEqekfhV5mGlb8tohvW
         wMT08kZ0tNkRX3Owgzw/A4QBNrTEgx3cjbg8qBV0oKcUOcJ481T4u/294gCzEz9Y1V4U
         lbJHEPot9nvf+9aWlXOsmuN3O/JioarVw72T5jMAwWNUJWSiEvkXYn0b2seq3gNXXhN7
         Pp6H4V6MvgHkRI9jxDKtDoQRmRru0pFwa6mo83Eut4LaoSyZNCQgg3mfR1F0FuRDsUxO
         yIyw==
X-Forwarded-Encrypted: i=1; AFNElJ+J61P4hk4paXziP+MvOui4bTzbF89gQfFOuoYAeGAxyD6apQH9+ZIRVFcgrNZ/RCDCtI9iXR/76n8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGwGaahEagTpjSFXX0eRhRTRBVJAxA1mMbZ6IJEmKRP4o0Oc0
	H0lfgM/ly2n1BDnZIgONxxCd4zIxtd/fE26YdcyBhCsx8Vk22gFgnAxg3uhVpFWiTSZBx6rA5UZ
	qbMbwL/GDOzVWt5mDUUz9jSd4x3cwtMANSD5tlwB3HOiQk4eT23QHiF9ZID/fFw==
X-Gm-Gg: AfdE7cleOTmJMwCv1ixNdEspUMityaQRYxkNQ/jHSj8GR3TgWRWhY3YWG8j5zMs8Gia
	YuHZGWu+zlL6iNFaR0Ra/L9ASbDb18sevRBLesdaIZ9avUO1xQ+hQF8eJyqg8ZZupPkwow0hIde
	8oLCQ+uAqPjolIpW5dOP4okn1xCI/DwVECggHIawOw4Le2xkdx91+L8O4gl/86JLa8mFGCsdZp/
	GvZhToIvV3lzm9ezUqAkwladxJeHTfDi8OUIWWy7z4ZwtzDU2DHRkJKuJvqtG9jiv4faARHAEf+
	ZnDVOEyon8pkecYaemPaqAY3iubgovWmJWsg3Hy6Ub6yzAb/ndHu5KK/Zlc0TlEl75ZVb7er7qU
	ojI3mYg/4QzhYK3RrqFN5Ge80b5whoDBdv2veQxDKhGW+8A==
X-Received: by 2002:a05:622a:1b8c:b0:517:5e32:af20 with SMTP id d75a77b69052e-519e490624dmr281782341cf.6.1782225316318;
        Tue, 23 Jun 2026 07:35:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:517:5e32:af20 with SMTP id d75a77b69052e-519e490624dmr281781791cf.6.1782225315666;
        Tue, 23 Jun 2026 07:35:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51afc29csm24695621cf.27.2026.06.23.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:35:14 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:35:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
Message-ID: <ajqZoOv-TvmOMLCh@redhat.com>
References: <20260623094125.95791-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623094125.95791-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Myeonghun,

On Tue, Jun 23, 2026 at 06:41:11PM +0900, Myeonghun Pak wrote:
> mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
> clk_mt6735_apmixed_remove() unregisters them on driver removal.
> 
> If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
> probe returns the error directly and the remove callback is not run. This
> leaves the registered PLL clocks behind on the probe failure path.
> 
> Add an unregister_plls error path so provider registration failures unwind the
> PLLs before returning the error.

Please run your patches through checkpatch.pl before sending.

> 
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> 
> ---
>  drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> index 9e30c089a2..04cf9665ec 100644
> --- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> @@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
>  
>  	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
>  					  clk_data);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev,
>  			"Failed to register clock provider: %d\n", ret);
> +		goto unregister_plls;
> +	}
> +
> +	return 0;
>  
> +unregister_plls:
> +	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
> +				clk_data);
>  	return ret;
>  }

This fix is correct. Since only one path will encounter this, personally
I would just put the call to mtk_clk_unregister_plls() inside the if
statement above to simplify this further.

Brian

