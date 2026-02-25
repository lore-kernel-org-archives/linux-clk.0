Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470432C234A
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025893; cv=none; b=LNpBdH37muFdp5F4mJmFPW9P51ttOZok0A2aWAyyZyANBlh14PW6weMYCy246Rap0yaulKMeVKcdy62eD+jvhJMuIQgCQgiAXgeGkjQIuGvt1ZgLdgrLCMnA2I2zPsHeiGk9ox48M4pJz/UhQIq9Jao+e3CipbA4nmuVRz3IjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025893; c=relaxed/simple;
	bh=PsmboVwe3e/3pySl/bLvjAHmqJvc/g7E09oBJOBuko4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqtePKjZYMsfOLgw8/5i2/SbF/XMerIlt4qibKJbYvZu7A0u23pA6vQtYheXwVXvW66m7nHfBsBqZjSRjuUlYlrwC3ze7d9FFBpMWRS3iBq0n69JS3BqcAGcPEFFTe7E262j8AzZ4Zr0egV8vopoGjQWKF2YDvIpT8xhuII4hVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C9j2azj5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YnwSxD5O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C9j2azj5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YnwSxD5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772025890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9CyHa6Qn5jctEWbw4I8lHp1h1t0NfjY1X6aEPFAKD5k=;
	b=C9j2azj5rdtuRIorQp35NqwdsDx4YcmNdebDjfhPzcB4NvQy0zNxhFw38k90E7h/+ilqZS
	QCfkQInHppStEjw9bouv/g/P+QVXcs+CztViicFpUqKkJu5b5080PaE7dbgocYIiCvkkHX
	LnS8FBxj9HIdZQ5oB8jd+B4bivZFjiA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-XiMq5vxEOAaWJlcORMsh2w-1; Wed, 25 Feb 2026 08:24:49 -0500
X-MC-Unique: XiMq5vxEOAaWJlcORMsh2w-1
X-Mimecast-MFC-AGG-ID: XiMq5vxEOAaWJlcORMsh2w_1772025888
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso927472585a.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 05:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772025888; x=1772630688; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CyHa6Qn5jctEWbw4I8lHp1h1t0NfjY1X6aEPFAKD5k=;
        b=YnwSxD5OFUg6wECj7a4cJqvS4lfhlYiy61qX+rwcvlHPrNxYAWv093koZCHG/EyWiO
         gC5OjF8iLb0Zjsz36YLSTAJWAmDWXbdI4kxZTGrqcnC5Hsqplq1MleAexIv0MxdVO/rH
         cGUGR0LWDUsQEpJ1hs7sfvxZFm2beyu+6omG1wQKAGrj/RJ5FZKPP+o3XyVmH+fwdCKJ
         ysk4cw+04h2ueN2W4RHZJVt94hyUKvcomKDyWZn8P4guQLh0LIY+FE/+4TiE4iSwURHv
         HPrLMjYgfnTvF1dgJ85bXCgWugB/Rfdhevniopw4HuN3mk0fK3s0UR4zziCUS2Jeb+Su
         7ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772025888; x=1772630688;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CyHa6Qn5jctEWbw4I8lHp1h1t0NfjY1X6aEPFAKD5k=;
        b=PnNWJB+o1woZHGq32ZJ+UBtPSMD9QbYxEySiBo5SeUwK87Zkj2ov9iomlPIyva5PH4
         ntBqXHrDJu+b9DB4oxHjUozH2UEsUS1IJHeRXxrsZRDoImJfd95Yu/mV3gKEboUNVISd
         U46GYMrm25EFdAL9/PoDpuMgL7w/DqUR+ynRZYpt1Rb0x9YdjORZyDpa6DGf0mGbiCLY
         P0ZLPKNV5ZMLYxdFcJuVc/LDtPKV166a+XpJzH9VB+d5ih4VFU7aq9fXc8TTvN6MwUzs
         EnftNPQ97MnJyoYfo7mZfY5aTYj/suUcbsPmYOBEyZLOfsqAwMidIFXnkaku8PdL+hM7
         WK5g==
X-Forwarded-Encrypted: i=1; AJvYcCVilKWzuLsEJn6fPM+Uv9cFQFV82iGG2a33dkFGmS6joJLtc0p/ixyYnnOeDS50kyiue0+7QBi4WCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOQdc3W62KhoL7JaOEcPB3fCmMtedcYOqPYDqWBDnluNdHvsl
	+jDpZP/vbP6sxaaicSvv1FcRga8VD4DgNVIkBnFY3UaxLyY4STz6wLXqbcE6ygqUiQnZo5KWvea
	a+m7W+QiFxyDxdoIHUs0EMeC5fSI/9TR8IO1rkDQENA5K7soZsyZmHZlvizVPtw==
X-Gm-Gg: ATEYQzzlZYJKecwkm4mkDX+nglTgb1Lb7kC5GlkZGGp8RHGL4U9WC8xxmNGx33uGT8x
	9m8w7FtMzRbDIXsDWNsAdPXe/WYZK4unlYROnO2g0hQuM+k9kXCg3v/i0XPKbTqhmxDjcpDSIku
	5V3fv3RPEm4ebPY3oEzCafXvwtdpSabAe3swbjq3D8olYNeMJQyK67Vxx9KeYyyYKevmYflqO67
	kBellyYGnUzjtw8e9EtzkX/+a9GW7z3rcX3OnpEj431GMNTqQCJJnnpMVncGPI46+kzBm1ZJzqA
	mUDHP2ix3xsAVFGQNgsgEh8QN84MQOu4H2UvsfguW1AUpdE+qrsVpgJukO/YZSZgfqSgR+TRZH4
	e4meskJT2K4tE2KwTgOWI7nEHtBsYWNXPMY0+0LNh81AV2VEDo8ok1EP9
X-Received: by 2002:a05:620a:1921:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8cb8c9fe6afmr2193115985a.29.1772025888389;
        Wed, 25 Feb 2026 05:24:48 -0800 (PST)
X-Received: by 2002:a05:620a:1921:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8cb8c9fe6afmr2193111585a.29.1772025887900;
        Wed, 25 Feb 2026 05:24:47 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d103084sm1542773885a.33.2026.02.25.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:24:47 -0800 (PST)
Date: Wed, 25 Feb 2026 08:24:45 -0500
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] clk: tests: Add tests for clk lookup by name
Message-ID: <aZ74HQjEhNe8YZqU@redhat.com>
References: <20260225083413.3384950-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225083413.3384950-1-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Feb 25, 2026 at 04:34:11PM +0800, Chen-Yu Tsai wrote:
> Clk lookup (by name) recently gained some performance improvements at
> the expense of more complexity within the lookup code.
> 
> To make sure that this works as intended and doesn't break, add some
> basic tests for this part of the CCF.
> 
> A new "clk_hw_lookup()" function is added purely for running kunit
> tests.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

