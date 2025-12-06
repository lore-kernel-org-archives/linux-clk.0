Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F742D9496
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765060712; cv=none; b=mHQJVfxdaS73zFVHhM4Vx8ROAsLsYZeIK0wJ+v0BNXWUBxh2s4R4NhlMNseJxaQPRpUIfhOEfGEIZkEzVbfAsTJlD7PDWp3PyFuwkxJC1biEVpTZ4NIauGuzoKWlXKzcB6Y2dy5AbKMfK+RCtFRGyHFG68OVILAiNj7tgtjwvO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765060712; c=relaxed/simple;
	bh=KmoV2rZ5AKGU2iVIM2AYgb1wpPXFToIrFzI1pYfPSnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOWWhNSEXeaRFGDS20ARjJFxSsNN5bgJwhVbeq4YtIj560JC0j3+XY78d5Xgvap0K4N3m20H/YMzAzPBY/Z673bpJv0OPwu/yWs4L1Jvo0pQJPM/VYQmQbHwVLZ+wb39YWCuRpo1UvxpgB4uOaxM2YEkwY2wPCet4LKPckPphB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pufnl6Ye; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZXi5NjBA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pufnl6Ye";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZXi5NjBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765060709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6J7k2wx6TcLXulctok64ga5/W4jQARzh5mw/1q6NJNM=;
	b=Pufnl6Yeu7eqt7Gs0mV2RXsmY275niXIohtlNmq/EagAAb0l1PK9IMjrC7z6imd9/iwKYD
	30MVkTcktP2A6ULAFC5QoA76fZcIvyBQsrJNlfg4ft2XxUkSxzyOIbtQdj3r/B56V1KEx8
	483ogOPfBthLH0HutOjR3W720vVsU6A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-Ob_9JrGdPmWiDNRHbair8A-1; Sat, 06 Dec 2025 17:38:28 -0500
X-MC-Unique: Ob_9JrGdPmWiDNRHbair8A-1
X-Mimecast-MFC-AGG-ID: Ob_9JrGdPmWiDNRHbair8A_1765060708
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ceab125so28150311cf.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 14:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765060707; x=1765665507; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J7k2wx6TcLXulctok64ga5/W4jQARzh5mw/1q6NJNM=;
        b=ZXi5NjBAnSpXe4YcvXQ7zADoOtGWda8Fonw7KkBDsGsBm8cM5y2+7rmyIZfikfM9xY
         Twz4b0LDG+xSLaiJY+nZ1WskvJpCSat3hfddnGdr33vLUclTfbsNp83r3WmXDYWAlR/U
         IODBUfwwtBCMVDUdSjBX5kMXOCu4nGNTjmYGgIF61xeK+B2zy15P0rhV1d4LLtGSfHRl
         +9yiGNd698/bc70qneongmt5AtA5vAFmL9xuxKaQwy4oO/ymnfP7M2dwhThEEntMsNbJ
         dkGRdVNso3fPbYvCWZo/uqxD8jhYdSgBVhzwKKeW0Ga+rNFxeQenIllk82coHEfR7hEI
         vudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765060707; x=1765665507;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6J7k2wx6TcLXulctok64ga5/W4jQARzh5mw/1q6NJNM=;
        b=UteOueypbBLISvWsTEPwuTDeBny0wo8Hm/Io64btv5kwgZplXwtQ8PU2d1DXnzbIrd
         3mRN+YuC7rq9WkpjLKwUFBpOi1mBI5oEFfeJpJA/VC7iQaNBSrZPKJrsoK9esmMYyaJb
         uPLlwWESukRVgce84YY3xjoR6TsBp1lCcIb5TwEsHINacLIkRmVZ5iHHdW5LZyDAdhR8
         AWe3Qt5Fbk9bxjXHTXZg031KguqqvRXW8fNyLGxFyZxJfgM4Ke+nZeSsUnBEn52JXozw
         Q1oy1OP7+P6zXwb6Yhn3XGpejEDJKad6uG8vvi1YsDhzCneYfTHT3FMhNrusUTf1vTpx
         /+JA==
X-Forwarded-Encrypted: i=1; AJvYcCV7LzjbYEOGMkS1MPm+AxjJjZg6nLDDm3FaxXUPQMt1duZdrYgf1qF0pmTdpWIPmg5sIhbqhoogFsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmjyArG78P2rNKtp2t4+AlCZ6YhO1rBb9K1mtV/345X+0kdPjP
	N+Vmpk6+zynEAPs3tOcCNxYcGZSDZUlvQ8/qP2EIo21z/keA+HdY9fy0f78IvgxBy+CkEQI7kCv
	RKQuOHcKiaZFq933KI9JyKoUd0BLex6IevXA0SRbKjbuHP/DXWOii/WWN+EBcEw==
X-Gm-Gg: ASbGncsujESl88v/PPNOQkmKWItM4pB51BzYyM7G38fxcz0GTyDNl6zFfqdMCJylUX7
	ib9yF3o8Neo9cLn2EuKHZni4VBlIAx0qKlt/Bk4zdKQaGX3t36S61GP2t98RwSKQfT3xsQ8MHkR
	p669kJz8HlKx0FyKfgKH3u8Wz0uNUkQ/E3MwBCW5zV7s9Ak1FPpYDUMF4TTcq3kK53dA6jRzHBq
	nq1PP9wc8+2POmWPP5OdjVZWYpkSduK56BkhXgP6qKCjVQOsZiA3t513B+4kni7+nd2I6AJo7OQ
	ToAunlt4L2JDs2am3re+7jpXNamnbddP/7q52/JuKZe9pRnYwm0xzx0RBUCPtmPxflQByN3Jnb8
	YdNnNF9ux2WH+s6obwHDrhLJylMQ0lsSKUXqPKrnkn/uW
X-Received: by 2002:a05:622a:5916:b0:4ed:bbca:fdff with SMTP id d75a77b69052e-4f03fd967cemr50533771cf.9.1765060707680;
        Sat, 06 Dec 2025 14:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNuVg2+E2WEXXi3BTjXYTG6n6VA3gziV8g+icwVVIj/ukVxiNF1wJHG/QbYo4ob768IcTNUQ==
X-Received: by 2002:a05:622a:5916:b0:4ed:bbca:fdff with SMTP id d75a77b69052e-4f03fd967cemr50533641cf.9.1765060707359;
        Sat, 06 Dec 2025 14:38:27 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0276ac6d2sm50647481cf.9.2025.12.06.14.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 14:38:25 -0800 (PST)
Date: Sat, 6 Dec 2025 17:38:24 -0500
From: Brian Masney <bmasney@redhat.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/4] clk: microchip: core: correct return value on
 *_get_parent()
Message-ID: <aTSwYHpdysScCnT4@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <20251205-clk-microchip-fixes-v3-2-a02190705e47@redhat.com>
 <f2d88272-2465-4fcf-b89d-b515a1fbee7f@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2d88272-2465-4fcf-b89d-b515a1fbee7f@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Sat, Dec 06, 2025 at 04:31:03PM +0200, Claudiu Beznea wrote:
> 
> 
> On 12/5/25 21:46, Brian Masney wrote:
> > roclk_get_parent() and sclk_get_parent() has the possibility of
> > returning -EINVAL, however the framework expects this call to always
> > succeed since the return value is unsigned.
> > 
> > If there is no parent map defined, then the current value programmed in
> > the hardware is used. Let's use that same value in the case where
> > -EINVAL is currently returned.
> > 
> > This index is only used by clk_core_get_parent_by_index(), and it
> > validates that it doesn't overflow the number of available parents.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> I'm getting this from checkpatch:
> 
> Applying: clk: microchip: core: correct return value on *_get_parent()
> [Checking commit] 910546c58dc2 clk: microchip: core: correct return value
> on *_get_parent()
> [Checkpatch]      WARNING: Reported-by: should be immediately followed by
> Closes: with a URL to the report
> #17:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

That's a false positive from checkpatch. It doesn't like the two
Reported-by lines, with a single Closes. The warning goes away if I do
this:

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/

> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Other than the above:
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Thanks!

Brian

