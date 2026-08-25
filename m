Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B9488DAD
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787673512; cv=none; b=CS8YMm7RZHr/oNW3gU7btlDNYKsgBAvY0weTuSEDojF0bqmuJSr1+5ziW4NKhRIE+ktF8fa22S99+YzChrqc6NCH+YmEWIeYqzj/vAlbRMRqThpxANgcs/MSQUNUpj1kzEtHk2wHlb1+3lqtUJ/tyNFk3TJCTMuaze+4UvE+Gnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787673512; c=relaxed/simple;
	bh=6fYdnRk6pjxrSAxMwAMTe/HvBW3p3tPhqo9+iE/1eec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D316bNwgy2jsLCw4JKtJxA1VL8SgUzmxp4WeI+pT7JHPj1/7W0c4bsKO7LybK7o7h2YCV1UuXgQ5IH7qf7EIJmSO4PZES5fRlIzQ26RZzPlRJ46Bp37WPdOwbCWD0mKaqs8677ge5R4F1w4f/gZ2CGPaILKARQXTGq9ZlICQMtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2he3xVX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gROz/wtF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2he3xVX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gROz/wtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787673510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zw8rgTkqg/RMXzjbEGS0cAS0wOEwqckgtTyrqfWP7Hc=;
	b=c2he3xVXIDvIlSvS1ysNqij7f6EfiG6t9GJItyYbkjQV9ZXqm995T81Jw2uGoqRUcKA+Mg
	FwHZ0hDEuAm70p88MGkK7SfvgE4EdYSpqmRyLsobc12/93gA1Qwo1hFDnv6/+ST+griI1R
	kKyskUNSBFRFtRq1ZiviJFym3NtxKok=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-z3nqOszoNDm8V22dIHIAuQ-1; Tue, 25 Aug 2026 11:58:28 -0400
X-MC-Unique: z3nqOszoNDm8V22dIHIAuQ-1
X-Mimecast-MFC-AGG-ID: z3nqOszoNDm8V22dIHIAuQ_1787673508
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so26869656d6.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787673508; x=1788278308; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw8rgTkqg/RMXzjbEGS0cAS0wOEwqckgtTyrqfWP7Hc=;
        b=gROz/wtFHyFHm7b1Xh61kdHuGftMMumJHsK9fR25bIBWs4rbNbz0szWvAqpLzwiGPj
         M4H4KMy+YTIS2fXIx7esRrwnwAxHivJYp5ZUlnPOePEg+bqF/OxfRwc+4QDH52zNCCIr
         aUh7j3DIbC2hP1DFNWIl+z3dF45mpDIxxybgaY5VfdI2cYlNktn/VltyoB3b2CBounLi
         BaG66ytaML9TSDJf1tYssG8tDdBt6+eNs99c3A9EReLPYrz7W7OG3s0AS2ZI5rXFWEAE
         MxUHYE25RzqvhNvoO6JI7Kht6gtqDvi8MgCnxZ2vckM+PXanwajWjbvOTN8MOnQGfOR4
         OhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787673508; x=1788278308;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zw8rgTkqg/RMXzjbEGS0cAS0wOEwqckgtTyrqfWP7Hc=;
        b=MaZIt/106BvMV/VIhdkKBtsDBz8qh1f0+XrO3z/k9SprSXl7xozk3cZPz0VBZEy0lC
         G37JpAhffGf1PbXZ5f8oy7qKPd2Y+Bdt5EJmKmQJmZu/uPxNfNIlAiWTB8q5BpfGL899
         HRlqIoLCvoSaLaXIo+eaOqLwq8C+MUbKC2qxAYMyiNISnLoeTdp+Yk0aApdF1W5b/Bps
         OtF9Fe7vpum24KF1LafZEx+mkr6oHAXCN0XaHQfRoDE6WJAFqy7QZOUoesb7WkzfAPzr
         siSxojjugkfxJGbrT+wLDNuqOfZA+yXreGkkzkraIalNcjmark3BWBQG+F8cfXlEoTko
         Q53g==
X-Forwarded-Encrypted: i=1; AHgh+Rpb9AiNU9e4NjTPLdGaTqNZPFIsOxASJIFZ+PulZx0BQevppWYua2cvHrwHoVdh7amLW9UNWTo5eWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nGXzPlVuLT+J1fHmMcRKV2oFVhLSZKSgg3a8BBuYwHd/LDe0nw
	LuwcRJO4f12Ifl984kjrOrGE5uiHejjcPn9lAwcSf/369QUJnC5nfcZdiTVY//F3eUZalwejxfU
	enkoAlaNN8kDPbe2XwfcKd4Teqxk/48zrT6xonF8x6SUKZ1whlopqXO5Zklxldw==
X-Gm-Gg: AR+sD13uV0UJ2fkebTSr7rXOi/BLZs1wG8aqszwmYXxltXu7WlCPwJjBXBzhrC934iS
	RYSvl7n9H5PAxcM4pQJuR2SR4K8hmMpz5485+zHTjff4oU1qFA64fvZZyVssVOqhwAYudrOs6Tv
	D8G7A6HwXbwD/czn13v1VDNZPLk33XRNOcosOOJpPQ2tbH5Hf0f9RWnAmCpHmDydBc5Jn5xNSu8
	C1iylIt9/nYG3LtRYZ0qGfS9Mcv288VO/uAB9C1Bfl/UWgNeL92wnukehQkftBxZdIpZu1D13iZ
	rNM2JUge1J0v9VcgFJv2yI45hI/8cYA2F839V821205hVMplWCFqOvEhoR7Yw6UxhYk/910j0H2
	Zr9zoOk1T5mg0fBZSEXpjXQePlpDae+vnRKQ=
X-Received: by 2002:ad4:5aed:0:b0:90c:6936:b508 with SMTP id 6a1803df08f44-90c807b2784mr342748336d6.0.1787673507538;
        Tue, 25 Aug 2026 08:58:27 -0700 (PDT)
X-Received: by 2002:ad4:5aed:0:b0:90c:6936:b508 with SMTP id 6a1803df08f44-90c807b2784mr342747526d6.0.1787673506916;
        Tue, 25 Aug 2026 08:58:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc64216c6sm1915416d6.22.2026.08.25.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:58:26 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:58:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yang Zi <2959243019@qq.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: si5341: Fix NULL pointer dereference in probe
Message-ID: <ao27oVjo2svicHc8@redhat.com>
References: <tencent_CF54C6DBF6CC64E627F5231BD1CB408C2F05@qq.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_CF54C6DBF6CC64E627F5231BD1CB408C2F05@qq.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yang,

On Tue, Aug 25, 2026 at 04:59:56PM +0800, Yang Zi wrote:
> si5341_probe() dereferences client->dev.of_node->name without first
> checking that a device tree node is present. When the device is
> instantiated without DT, e.g. via sysfs "new_device", client->dev.of_node
> is NULL and probe crashes with a NULL pointer dereference.
> 
> Add an early check and return -ENODEV when no of_node is available, since
> this driver requires device tree bindings.
> 
> Signed-off-by: Yang Zi <2959243019@qq.com>

This patch doesn't apply against linux-next. Otherwise the change looks
fine to me.

Brian


> ---
>  drivers/clk/clk-si5341.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index 2499b771cd83..9d901c2fd0df 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -1567,6 +1567,9 @@ static int si5341_probe(struct i2c_client *client)
>      bool initialization_required;
>      u32 status;
>  
> +    if (!client->dev.of_node)
> +        return -ENODEV;
> +
>      data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>      if (!data)
>          return -ENOMEM;
> 
> 

