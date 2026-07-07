Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A31F3033FE
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435654; cv=none; b=jXeZXApg0zgUULRUn8nMSgJkjvzmiyOrNsN1OvaHPlz/p2zxxsaa9HfUoKyF+4HVj47gfuf2XJ0SmRqh/lQzW6ME0aTBiGO1fWk1A7v60SApaYl6m/oaVeDWFbCZvui8B3ZdfccgYQbaUrAlGWww11GoB+w4x4nnVTp9TXwe3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435654; c=relaxed/simple;
	bh=nkbeH07ahq6lR43mT21OcufoIF0m1FgGm9Tv0j5qWJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFevmar5cFqBbV5TEuQLqhq3KEp24Cekh/tKArDdH63ehT7G8mItNMNrWegfrgeqZLhIs28vMgeCbkX3QgTxEmHwnlBiba8v46U7pJ5ycZBRqkpmg5FVW2iCV9GFqFHXqttMBI3IYK7KTW+cDR8wEvq/Gsw0/Ll62uyTfcPGW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQMtgnd5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CKz2W3gJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQMtgnd5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKz2W3gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
	b=IQMtgnd53eQ2r96bnu3FXbo4PrVwM/j4Pd4jnEnXC40+Esl8hzcm5KUksQFIaD5TmgXMFy
	r0adlxQFTRFcieG9WWj6nBxy6KaO7PFG5egE68Hxl7IBuFXp+0pubmJiG0r2lyNbxHjrY2
	xEnWOJvGNs6Gch9HdFayDlUb8JFQrPA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-dnbLi-FQM0iiuK_V2ztMtg-1; Tue, 07 Jul 2026 10:47:30 -0400
X-MC-Unique: dnbLi-FQM0iiuK_V2ztMtg-1
X-Mimecast-MFC-AGG-ID: dnbLi-FQM0iiuK_V2ztMtg_1783435649
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e0e71e05so6522552a34.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783435649; x=1784040449; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
        b=CKz2W3gJMM46Ur24g18H4MS4Ic6xUKB2MbZ9v08l2ZGykiLJIBJhRiQhWEYIQUrvnX
         Hirq74N4/RUXYVwIPawIvUJyds/xataKBufdJhSt78XO1ORtQNsBeGYok3MwufoaveDs
         S7/e+bMWPIxbY79AUrx712lzIv+/esmQwJu3KsLbFOpsEdyLR4Ydnizmi4RhpUPDDcKn
         ucYhLKR/WxITSorVb+HjzsLKROwgxWRv03dEkUk+dMrlu8GdwtFJhCLfr3FNIcLYT9Ei
         hnBQtF4lPQUTBQL9ZcpxCz8eASIxxeoSNkOJYWC6UdNFETy4vKfesC0Kl+gMkkZGrPFq
         zKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435649; x=1784040449;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
        b=A+M30v60DCb+xQOPr/eC0UpDyFvyMXKx4ZmLiVgu8K1GWWlKkyJxUhpuhQ2evMOEaN
         xsjOucNDuPFyrcmUHLiaj3IQoC+Xj3/3EquAAfAi6v4ZLlnm5HRjpe4aJXt1fse/MyMZ
         hbKMBAKpJvGFwPLdaF2FUrrb2CwcXrGRgNuJbuWz5VdV1pjMD4XezekN6J/9tU+t/kD5
         CrTpZQYMdMkUF3VMzRIFoglflQJ6xwwhAHKtef8NTUGXoj/JRVNTRuqYtQFI358wlEtw
         VP/KMsNQ/pi4jMYO5t6ftnrXat0AEYtDDDmm2Hvd+sd7aaRLZemSmKvkqnwMxxX6F+C/
         MNpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9t5sVDBdYM+6HLyBmPGDWO4Hxu2ID1C1MtXM+B+s3JVAZxmuUMg7mobVLHLhuPV8FPrx7kWPQPnlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YziyETRZo7jm3UeGU8IE9Mb9B1NGGJq1W3oAJNvpG3q5dMQgKsZ
	ideOQRrlGyI2tCVZD6LpkK4UuWwhW8ZdDuq6KLBxpp0Kp22h3pINUkJweZxs4w0MRTKY0AtyIW4
	EIOKJQBScOQAV18MC3LvD3kETUfr7ERnfzO1RIziQ0IRsvWyNsp2mnLbWz+DqIA==
X-Gm-Gg: AfdE7cnnAcRyuQmebZlv4Y9Erfnxl8nFy6lgCRCfbWQqanbx2e9VpBMfXBmY+Xy2rIX
	xVWvXrqV/BeGDviO9ToKPbqGbboIGj78ErepUqFgiBrjU5inT3Xjo3yNUzqlZ3Beakpn3dfsI5m
	TwXRqcx2LPsYopsFHDh9dPuIfn+h+iC/HMVdRyYlLYKlgQGqNd2wrJDSqkCNbQ57yqm9gBfPo3i
	+7AyNM48qaqzgSSL/BuCqHSQnPrKelLtqVKI57zHzzrcetp8gf2ITSKBCNv9ah9CZhS+qKlPB05
	+p6nsdZlGh1vhBKb9kSavKVEhxOv/QyqH9I5cr1N9zmMkselXvdHE+zE3y6jyNbiu+fa92M49wC
	r5I0UadZU
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3395665eaf.17.1783435644622;
        Tue, 07 Jul 2026 07:47:24 -0700 (PDT)
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3395595eaf.17.1783435642165;
        Tue, 07 Jul 2026 07:47:22 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544a1725sm13981552a34.16.2026.07.07.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:21 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:17 -0400
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
Subject: Re: [PATCH v2 1/6] clk: mediatek: mt2712: fix memory leak on module
 removal
Message-ID: <ak0RdSkV71J1_1By@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-2-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707074839.240676-2-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jul 07, 2026 at 04:48:30PM +0900, Akari Tsuyukusa wrote:
> clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL, which leads to
> calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

