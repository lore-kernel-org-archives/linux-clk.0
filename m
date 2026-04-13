Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED10314D26
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098796; cv=none; b=Iedhp13ZHROwP2LE5ObY9Pj68FPcfUK3N+NaDJg635Rq/f27HAnNxqEFKX9qJaPN7+Yj18NoB4OgDRFzK6yugCompej6vGzoPfm0xtmcQZTtTfH0PNSe7URTd+MjY0u8kfQW5D6WEc8zIZUkoSX8S3jOC5JM0fs+6mVz4i4/utU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098796; c=relaxed/simple;
	bh=chmoZmOPdz8JE9W/6rS9Q7KoVVIpZZr66rPx9xp9BsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3cDJRCDUWXtQT7PzCAluud5h0qJVSNa9xPiOypDAgS1AJT0Yz9Y4uI+cb+pLXXL1DDvWuuXhTO09dSgqCStzbE5GdROs2+6SwMdD2SS4C7e4jG47CmcVr5+rL94PtGQj7E8fyZVBPlkmsoo5TPdHNrHYQCnXrJjqdFSFlljew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=htDO4oMg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U1m7n/JO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="htDO4oMg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U1m7n/JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776098794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1PPAOec4m3Xk8tVFNcRUtZ/nDnCQH6sVE60gTwlAeyg=;
	b=htDO4oMg2Uo9kmZkopVhtAqMtaNqgidY4hyH9l+altf//ZboOah8Q4KonEKedW2fSvCNCM
	ug/7NRSZ3PWT/10gqBYm+QIlizVLNjlT+WHSVH5w5RAwXPhB17a3h5uLpdTiyTHcYFMaSX
	dx5dnsQ4/xh/4XBnwpiPyXGb5ztv5rE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-sL6tkfSNOh2LmQEQlisbyg-1; Mon, 13 Apr 2026 12:46:33 -0400
X-MC-Unique: sL6tkfSNOh2LmQEQlisbyg-1
X-Mimecast-MFC-AGG-ID: sL6tkfSNOh2LmQEQlisbyg_1776098793
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954803bd74so46474716d6.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776098793; x=1776703593; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PPAOec4m3Xk8tVFNcRUtZ/nDnCQH6sVE60gTwlAeyg=;
        b=U1m7n/JOBmxfzANHnzo1iiWJW6Q9yj6F7wC+PPmBNQeQFHkC+fu0pKmbgbxa/VCwL+
         gwol8+EsrXj5D+j96I2bVJFFei3P45djS7f7tby5HZ2kVeT8jE+8tiPUMp84MkR8b8kJ
         C8s2WpWXp3B3PH9Yk72DqGDiLaumYL91l6uNrqJCQnQNHtTP3CHe7KptKfSsRK/Ig+lI
         qr/Q8Jzo3M4Lvhi75FpXbfea7hKqnEaUCucVNNtmnDqrfIoD/PkOU27S0vOvtWcZjI7W
         MfyG0SRVyVNcs6Wb8OsxspcJWDGsEA1Q9Ole6IYu9cfFDBJfkoiHVeeIcrFQiAVCgB4E
         8Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776098793; x=1776703593;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PPAOec4m3Xk8tVFNcRUtZ/nDnCQH6sVE60gTwlAeyg=;
        b=O6FD/CT4aFwLmUeu5VirUNxqEf3LXpFC1N3eN7SmwiPUF3t5bFwm7Nga8DD7KT/sfu
         pJhpD5jZXnLIyuFdGYRHeUZbRAm6KwLiyP3OPn8cV1irSfd323XUBq9a1u38EFdEhUo0
         wTpdy8G3mrJcifTBWmC08dbW7+UlHlOmq67Nl0z4l7iM5tRWFeZc8Opdmlfhng+b1F7j
         8A/O3F+hSnDQk/vW++bSCA2R7YR1A2QoCy1OZLOOWyD7IlhGQsOAYliKuw/ExPkuaeGP
         xZCJmtv1s3xvjTIA/DtKBT+bnUtLn0xnLWRJzuDcwWLRYtbnRqyKhx6BqMF+Km60Ec6U
         b85Q==
X-Forwarded-Encrypted: i=1; AFNElJ88jIj3cSBB0diTr54mIZvccFOIZ7NPDyo/9pAooTwNRsdljx0G9m6jMiw/udar8NxQMSAb+/fXv8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgcGxh0UBzgYk1laVbHi07F31tOQksptQLQumUDAV0zqi2U/jI
	Sk3GBv1TnOKWuTKJCz6V0EZzHOlv6zY2RR8E6DBkKaUzLjDuJS8yTkTvO6GdG2S+zd743AwzPlc
	5Zon3UxHFtrOTeOadBfRYaXGrTcWggvXIaX/8xml+JIibyaef8pe77UO5uZDkEg==
X-Gm-Gg: AeBDiesOlfUm0pkDa1TFEv++wMiD3BPXXqQG6FP8eQ7wLjstvYb0GZsrZBKWxUu2WoY
	ONdxOZmkulVEpD7kNnqz7XOMymoSMB58zDeckaf/3gJYbDf4EBkzYsN4EQ/8VgsfdU/yKAYEEw+
	X2L99mi0zY8GGNsmvHph3Lt4RMWCOwJA9xqNgcQmaKwg4SGMPDhbZqOREwg8iHk9Lg5IJWciEuL
	Swyf9CT0YbwaJtQkohFIOn0PGV2stj+B194ZEUZP3pz9H4XcjtkMdUVjkhizrRIrBP2unDuJIGl
	coGcDHBpf3TZnMcUZm/alvZSGX/zn1JRdiPc6Uvqs5o0s9ontnBCOSVqhl00TKcms4c5FdWrArP
	augapyY0d6az3gJalFAAJn+pm1REw5UuaN7bcJeN1WB7vl62WsxD5P/ds
X-Received: by 2002:a05:6214:3118:b0:8ac:a1a8:43 with SMTP id 6a1803df08f44-8aca1a806ddmr100344956d6.52.1776098792414;
        Mon, 13 Apr 2026 09:46:32 -0700 (PDT)
X-Received: by 2002:a05:6214:3118:b0:8ac:a1a8:43 with SMTP id 6a1803df08f44-8aca1a806ddmr100344376d6.52.1776098791686;
        Mon, 13 Apr 2026 09:46:31 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a104ddsm96436786d6.14.2026.04.13.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 09:46:31 -0700 (PDT)
Date: Mon, 13 Apr 2026 12:46:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] clk: starfive: jh7110: fix memory leak in
 jh7110_reset_controller_register() error path
Message-ID: <ad0d5fIAkjblQcIt@redhat.com>
References: <20260413143643.3002454-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413143643.3002454-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Guangshuo,

I missed that you sent a new version. My same comment from the v2 still
applies. See below for details.

On Mon, Apr 13, 2026 at 10:36:43PM +0800, Guangshuo Li wrote:
> jh7110_reset_controller_register() allocates a jh71x0_reset_adev with
> kzalloc() and sets jh7110_reset_adev_release() as the release callback
> for its embedded auxiliary_device before calling auxiliary_device_init().
> 
> If auxiliary_device_init() fails, the function returns immediately
> without freeing the allocated rdev. The release callback is not
> available for this path, because it is only reached after a successful
> auxiliary_device_init(), for example when auxiliary_device_add() fails
> and auxiliary_device_uninit() is called.
> 
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review. Free rdev explicitly when
> auxiliary_device_init() returns an error.
> 
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v3:
>   - clarify the changelog to describe the exact failure path
>   - note that the issue was identified by a static analysis tool
>     developed by me and confirmed by manual review
>   - apologize for sending the initial public posting as v2 by mistake
> 
> v2:
>   - initial public posting; v1 was mistakenly skipped
> 
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 52833d4241c5..55cd0ccbdb84 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  	adev->id = adev_id;
>  
>  	ret = auxiliary_device_init(adev);
> -	if (ret)
> +	if (ret) {
> +		kfree(rdev);
>  		return ret;
> +	}
>  
>  	ret = auxiliary_device_add(adev);
>  	if (ret) {

There's actually another leak in the error path for
auxiliary_device_add(). I think this code should be
converted to devm_kzalloc().

There is no devm_kzalloc_obj() yet, however according to [1] that should
be coming soon.

[1] https://lore.kernel.org/lkml/20260330154108.GA3389518@killaraus.ideasonboard.com/

Brian

