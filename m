Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC050280CFB
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098554; cv=none; b=b3KwqU8gdyQG7wYCd4BCOvVtRgauqibcKtOLbQO0XC1a8Mn11dwr3H6Veq3sW1kLMBhhcl+2WqxNZt4RyFmKkEPDNZ0FBvyRjBUQLDxd5p6CVJECSjNBAVCr/uYtIS5DQuD56lXx/J+mSeS1uyACONKRKz7W50WjIjLht77wiLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098554; c=relaxed/simple;
	bh=5W6Zy1XK1TAXTv6rQnCiO3JaK6tOysBBxFy1WxXFYSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYHWCO6mA/0D4UpVWQu8p5GQXURDj3xK7PZj6No5rMJUqoCEsPuzPgtEz9V5lznzObPyLfIuosjSZ2QS9sOqOUqsfSjlCuQKmkMLlwXD6tYvmXMHMt/RRk28MVyAIuBBXZVTaBO+WTOVEZqCvzVSHouEHnGIq9zORO/boSAeT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8Bra74B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j4xancHj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8Bra74B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j4xancHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776098552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WO6WRptWW4sGTxFeojTyUtfweOrswI8hobePqSBWs7Y=;
	b=g8Bra74BSZKaYaEBT9WRCsdjuKi/S5PMfi80Y3b6v9T2eoBTDnKW5/uPl91RZBtyxM2ICe
	2QsZGy38OfLzua9qE65oCQLhu18vrKA7sJWwZ+x9d6FG8kIjPLsH7+4DUlsi236VH24TDr
	RhbH9dMImApZ4a4pStk8+mgrsvt/LBg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-mQTFpo0iOwWlVTBIwSjfzA-1; Mon, 13 Apr 2026 12:42:30 -0400
X-MC-Unique: mQTFpo0iOwWlVTBIwSjfzA-1
X-Mimecast-MFC-AGG-ID: mQTFpo0iOwWlVTBIwSjfzA_1776098550
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfcf23c0e1so902135385a.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776098550; x=1776703350; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO6WRptWW4sGTxFeojTyUtfweOrswI8hobePqSBWs7Y=;
        b=j4xancHjo6YvJ/fYARrIgKH9X2E3fVNA9IJsh2RSvV2deRkqRmWtRP3uMqF8OhBqCo
         uAKSojtnfetM1MfR1wYN6jlwhaZ/kqNqLH9JQ3+pwEEI3aUdDtJkxjQ7hwpEg19LDcqv
         b7Bt3Aih0NYO5zismZIPpftn/atMxwcqZljkvt7kGUqzh7Erx9pOBjz/qkseH3ncX6oP
         XkBp3dX0eeK6mmF6+GkYt7F8ps7cTKNyyuxAuoWuCU6XhTi+1E2q5KtM+DQVzk1FBlDP
         SP7BEZLJi9G0qesCG9Akfkuj/DMMNV/rWdrxSmqd/KeAD7SrV283XftqFt6gU4PdepVC
         PJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776098550; x=1776703350;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WO6WRptWW4sGTxFeojTyUtfweOrswI8hobePqSBWs7Y=;
        b=lj6QFNWDtT42dxvwCkYHY+0HEiRhXmao1QS8Xmhudlv9DaAsmSc3x5l0H5QTAGUYfp
         G8PO6ZLTJf7RADeIuAtcm7A9wo6LO17RQ78sW7lfGRATKRqvS9sp7W1s9yFR/T+biw2U
         dvLIA7kk6LYnmkrwDE2HV/7zEbDgbYyDYk90RGXmOoXpClzzwnjzF2lMIyP6/jMoNKCy
         p9oH7rivZFhktQ6XIrb9ckJ6eyd/91jJ5sDaM5Kflz5GzFW7W095j1FrEYLPjkjRMb1v
         DvwM8uFZewIhdXI+j5ToTkAZsOfKbzs+F7CU5lRlh1+HAF9rK/THMjDwoY4KPtWrWWR6
         32Fg==
X-Forwarded-Encrypted: i=1; AFNElJ+uv1Kv4gvedtd9wPA7gIEcgY3f+obrxf4M9gazBpIz3n5P40Z5tqm+4xKqX5vCEcQFwKDA78ovBSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YygzCDuXtoXde+fvnWAFGqM0jKIyJhNH40/TPplYRqXW6RhlrxQ
	BLpByMdeabOZK4Xzo2I61grtABiMEry3MouOUtFZKtkqqSwDYtweOk5bOSc6FWEwyYx/ixCdxad
	kaGGJISE6OUwh8A1AglvuxIoz1CNWFj3jcV+iSmM5RAIxgpvtJUl1bVwzUxxqcw==
X-Gm-Gg: AeBDies8gGJ9w7mF1QQgywnAY3qDfOL+vVX+WMYJlutuolqjeOSPxL6Q1zewUVVjJ0n
	TfMaxyEq3a3bQ0RFYf/9XAsTxKs0nO9hzN7/mcn0QM+NH6KIwrugPfLLfgPFtZyVqNN54KX4Tui
	zjrsCO2f4WpYF2qTdSjt5qjrQoALNYr7jE/s8NKwupmZI1P4K731U09bsmXJn8tqMZvc3yRVfRh
	5A+2AuHTuSYk0mld+n8lw5Vp1bdm3N9fc/+X1qX1nE7V+5S79Kr+RlZxXtnMjIT9cdMlVLfdHYz
	FuUERnM/PrL9nfuvbmEQiwVgGjcvPJ1j3KO93UBfDUuW1APUBlFCO4shdn1BhEujHaaLU8eoQLb
	E7WC8F9WCnKDQHFvolBZOzw0HnRy+a79v48cebTEHbHTsdWjAhgmJXfWt
X-Received: by 2002:a05:620a:4055:b0:8da:384b:9545 with SMTP id af79cd13be357-8ddccb2f661mr1997594585a.12.1776098550176;
        Mon, 13 Apr 2026 09:42:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:8da:384b:9545 with SMTP id af79cd13be357-8ddccb2f661mr1997589685a.12.1776098549609;
        Mon, 13 Apr 2026 09:42:29 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb9833c6asm908617885a.42.2026.04.13.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 09:42:28 -0700 (PDT)
Date: Mon, 13 Apr 2026 12:42:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
 error path
Message-ID: <ad0c8y1u5zAhheJX@redhat.com>
References: <20260412124247.2494971-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412124247.2494971-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Guangshuo,

On Sun, Apr 12, 2026 at 08:42:46PM +0800, Guangshuo Li wrote:
> eqc_auxdev_create() allocates an auxiliary_device with kzalloc() before
> calling auxiliary_device_init().
> 
> When auxiliary_device_init() returns an error, the function exits
> without freeing adev. Since the release callback is only expected to
> handle cleanup after successful initialization, adev should be freed
> explicitly in this path.
> 
> Add the missing kfree(adev) before returning from the
> auxiliary_device_init() error path.
> 
> Fixes: 25d904946a0b ("clk: eyeq: add driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/clk/clk-eyeq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index ea1c3d78e7cd..a48ecec4c9a5 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
> @@ -346,8 +346,10 @@ static int eqc_auxdev_create(struct device *dev, void __iomem *base,
>  	adev->id = id;
>  
>  	ret = auxiliary_device_init(adev);
> -	if (ret)
> +	if (ret) {
> +		kfree(adev);
>  		return ret;
> +	}
>  
>  	ret = auxiliary_device_add(adev);
>  	if (ret)

There is a leak in the error path here as well. I think this code
should be converted to devm_kzalloc().

There is no devm_kzalloc_obj() yet, however according to [1] that should
be coming soon.

[1] https://lore.kernel.org/lkml/20260330154108.GA3389518@killaraus.ideasonboard.com/

Brian

