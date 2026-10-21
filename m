Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590091;
	b=S3wLAF+l29YenX0MljjyI+Stb/7rIfFMVSteFl7wlyJuWRBtc+SF3B3ojVGfG2XVbKvO
	 ZIw451siVf/F2VRnch8kNc8iNMfsilyaRPm8rrztoxBsi1Wv1AkrDpueMBsXra6k0eJlf
	 RV6Si9dhZy/Mi1Ybki3WFH7YwZsf1jHR5f9SVxjg+JcwhFCXhPHteZ0RVaeUNMXB+Yddq
	 5jD/yb8XNj4RhUJnBrPJBY3vFN4rPhbJpoK+2Vs1l0FSIDTYyzlCT97X96EImphw0VsJO
	 wSG0GBvxiUCnP7vG8wPfbm6nTjn4U0D+oSLwAhdIa/9tH31RLuX5h8K6n8uP7K4MGNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590091;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
	b=XSjsPnQaFiNQQ5DIGXy7CtzxyaBpTVxyht4CQmAN4gQPJ0mMiZTwrlPnUBt6RwXARBTe
	 p/GAxJAHe6/VNv+SjBuX+NF54owyre1jKcIXpQBKBKTOYU++OZcD6uvm+nFeL7KPadScB
	 8aMfPixMjg84GqK3iQ63vHFT1Hc+yaVtXok+YleanAURF5QdIcvaSlX5TblM4rEybHoJF
	 yx8C7ihzSZOL65TsLn6aOBALIj+t9b7qJv1ZhhO9X6RzMXmrDHqpqKbIZxvww5oOvpFQO
	 hqN7aNyQsfCnbtGvS4WRWyuNReuB56crpyLizisvJc4isvJncUlRHdUbg7zGNRcc4sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJccSif+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Vo/gfEI9";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B142606A31A
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 13:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B142606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJccSif+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Vo/gfEI9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792590090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
	b=ZJccSif+bN+wWXyGEe70tSLHpBhUNKw0dUGHPnIPyltiCoaBWjcC58SFVAaLz0Dq5cvDxs
	Txus2u7TmpuEeQgc6SZ+uXGb/dIXpAhe1It6Upyqt1dg3THwyVx1zNktg5/4M4+R4W1I3M
	nBIDvkDIt35OOulnVaS2TEDXzjxgsjQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-BHg-tvBFPle4eHPfLV4v7g-1; Wed, 21 Oct 2026 09:41:28 -0400
X-MC-Unique: BHg-tvBFPle4eHPfLV4v7g-1
X-Mimecast-MFC-AGG-ID: BHg-tvBFPle4eHPfLV4v7g_1792590088
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso135604985a.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792590088; x=1793194888; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
        b=Vo/gfEI9F7cOYKyEkehqA4dhNl61L1PyaKEWjqfDE9h+GyilCPgN0m1zGnyJr8l6YM
         r1BwIo9//XFFPmgh/EPGavymTGTf2PPrfVMpMfXyEl9FqTM20+V8jer1c5Iow1LooMws
         R+Kc8KACz+wEeIERwWWlcaVQKN/45NaX8kx282N/eCsp9NTh1vY2GyfP7eOD5dyjufYN
         UdbL1k9Hy4RQtHUUObvNjwKsELm+fSSbqhSq52mmYOGHta3DTMHqucm/i9R1ZqrKpjQ8
         nBGlFT9g+dkBQyX+agD9c/jM64Um3npiCOFTa6iNWLTzHmLHQmiegVhRGLToTrscKtkC
         q54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590088; x=1793194888;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
        b=DZf7io5z40KSxsfOW/+V1VeOxjDjc43ryccq2YtNAvxtVJrUsvfap79ZVmj4HldL8C
         H/iJpK+r56iOjOSRqhwfvHKNkx7d3SazJDSTxgga2hUFzo/euDhKWCaJs5ViagcP3s3o
         iUcWyAqOCNKmm4AG+XarTdnpKXaqP+2Lbp/DC+XoDE0DNyposoSGqiuzSDKDXBvH6XA7
         rnTHHrMckubh0YoRSOMgEXKA0mnonhq/7usR4l2KY2D0o+/dHWqvp1ypGQ4iomyDOcQh
         woGzjgoTb/6aDaAJao5EBgx9D7sx1OBIZjJkIslezJxmZdXWDwphfbLC8poJJ8Y42LH8
         OAWg==
X-Forwarded-Encrypted: i=1; AKwUvBx1H4zNzXeetzszkEacWE1ChU0A0c2ry/cZJaZ/RQMHj/d6IbkEll3MGZILbAyN/bM3J/gT+2kzHo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJocGNdlt6guktI86ALs5CVf91/DWYU7SwVdNo0BYK/bjOV3MKL
	IDR+ihd1i0gbu3iP5wwjo/vH/GNsr7O63zkCdkb1ILZEeU2e/wh/de3cjjRtMELz/2kiIDg9tPW
	Z7fB2J0/KQgUOSOQUf7nGZBSb86kgswhxA7C7n5v6CKNR9o+cyboiHHLjjQU8Rw==
X-Gm-Gg: AYBFou0Yc5xJe/juDYiphUIbIsNnoxxBlwamjDjfg1sx8/k8Lfsb5lSodqFYVApjQge
	iSPhJVLCUserJinWE/Mr0w/3vSXOjTjEQPzq/6axd+Y3CdCQgG+cZSvm1e+w1Ik8dc5p48rqY5c
	uGb4BiAIRAdPVSoxL+yF4arxL9UUnPmsXKpU9S0iVYN+MS7WkG3aB+LOLyrXp7x7FIYkK4ckB/Q
	YerVokcT6BFRJLer67X9KiNII38Glg6Mu6Yhrh0KS11PxZ78q8ZXHo0kYdXCyhxUVYaqzuku/7P
	zwCYrOPU7hxXwZYwCJ0QWro8BlCiCsa9jjrxFzDgFrrsH3qgnERkpnaPEP3RFhvcVlI564uw7qo
	kfmn4Yz6IwYvvUd3wiJowEFSO2+hVOAwkN3ezbECObq7y7ldDCK2QpU783X9kX9EHs40=
X-Received: by 2002:a05:620a:2b91:b0:939:f978:c1aa with SMTP id af79cd13be357-93f57ecf03fmr403505185a.11.1792590087917;
        Wed, 21 Oct 2026 06:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:939:f978:c1aa with SMTP id af79cd13be357-93f57ecf03fmr403501185a.11.1792590087408;
        Wed, 21 Oct 2026 06:41:27 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9a495sm259379385a.13.2026.10.21.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:41:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:41:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Alberto Ruiz <aruiz@redhat.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v8 0/8] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <atjBBPgt72Pug6IY@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
 <87wlrcsmv9.fsf@bootlin.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlrcsmv9.fsf@bootlin.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Tue, Oct 20, 2026 at 12:11:06PM +0200, Miquel Raynal wrote:
> To be fairly honest, the discussion at LPC about how to handle this case
> (and the transition) did not exist because time was flying but I do not
> generally like the approaches were we introduce "the good" alternative
> without enabling it by default. It just makes the transitions endless
> and more painful for people who already suffer from a problem. I am
> fine keeping the old behaviour available, but I would be in favour of
> making the legacy way available with an explicity flag, rather than the
> opposite. We may break users, yes, but otherwise we will have to support
> the two calculations forever and nobody will ever notice the new
> alternative.

Honestly making the new behavior the default would also be my preference
as well. I think it'd be good to get additional opinions about this.

> That being said, it works! So:
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!

Brian

