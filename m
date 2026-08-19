Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE763C2786
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 21:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174903; cv=none; b=XeNbHm/w3RQhWdnaW8W4lMfWK4VGUgN7OGuPrxHaI1P0hBK5gXz4mlPajqBM9Q2H2yrkPa+RO7wDjYR7RqC/9uiZsZkTGYBkRnno5hkdhh2OyaAUut4JCvM5xZPgxe/X2d27k0WKZpbwN4BG+ZsGprZJTkBsIpUX6VehSNDhXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174903; c=relaxed/simple;
	bh=9+vrY2WC4ZoIkFOxKaJaQJdQ4QuQc0xv8f82LVBkWmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Od/1+aTnxneGB2ZBx1F0XlDNdyWs/IZjiloV2+mv6iAj2lxR4Gwd/JXrYdN/Z1agEHVrEBl1aP67XAS+CDbuBQBc3SiE1E1IUsvGIcXBchgDAvfLmlKQaSpnmLCxgqfolFNGeKSKEv7lvjl/iZCXoVmUKulmci3y5vI9YGO+nR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpshaSFu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XgLjp6gq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpshaSFu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XgLjp6gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ajzV8c1ll+kVcclTyddW9HB0GLh5YAmk3HylAH7l8/Y=;
	b=VpshaSFuUoJg2r/IuEPPSm8K9mHS8sUWH7B9dQA/mS6h2dSRM0l6BuEJFNtTcuNUpa9S/K
	9B11QMwELJ7AB1hZIAvIeGdZOR4/EoAws1UBb7YnzrITlGMm7K41h+AjW2QMAwBFLP01Oo
	ud0at1KgueboYQt49jeZYUMT4t5ru4w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-tyPkP5IkOYiSblU4PlVxtA-1; Wed, 19 Aug 2026 17:28:20 -0400
X-MC-Unique: tyPkP5IkOYiSblU4PlVxtA-1
X-Mimecast-MFC-AGG-ID: tyPkP5IkOYiSblU4PlVxtA_1787174899
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930dda91cbdso287664085a.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 14:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174899; x=1787779699; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ajzV8c1ll+kVcclTyddW9HB0GLh5YAmk3HylAH7l8/Y=;
        b=XgLjp6gqQXpsByZ4eNFciitWFAKdGuhSb34kh+PT/MQREKjvh4fyG4MdWC6aD4mimb
         A4d2e+qW1pGCGexcV3GIjTi0vmOStU/oaPqB6V3j7C6arBZw/ovRhZwX9YiRTYmk+Vze
         pdkyjagpMe4m5EtCTLCkyFIF1Hgn1y9FyCS1u+wbNIC/pXq1ht88uksZOzrpuoCUs+Wp
         yk6dCOfFED+DWiqWei1Jnu/B3wawlz4h0WxY7lRTJpp8kz4DXyywHfN6KTmkCCw4pNrN
         /Wb7i2JrLtUcvxoWdqP+qKQ/h1Vx9zfjQTT98sxG7w+E9tXWQltEPtaM6QosYFZfvjrW
         dKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174899; x=1787779699;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajzV8c1ll+kVcclTyddW9HB0GLh5YAmk3HylAH7l8/Y=;
        b=FqcR7+r9HWCE/9D6t67aHgRAdtiLRIyLpVrIp3l6f+mQ5MMwI81heZwmcFg2CMPfVD
         jBd3tRdOmkUf53k/sxytyZdyyDaQnbplrgYj1NwlyCx49E6R+wzwHl+qrQa+h+kBjF+F
         fJ+9Zkgp7ILvtPn4OsmqFKVzWRZ3HAtLTDhKpnGhuxl1sXeqjhKTA9k/lvfTzNmXI9Nq
         n1niuCLv2SbaMTwp4pfSU1DPKAGRs7qIIaYGXaGbXGgGQLlzwIKqdMUQK1LiB3N7XmbZ
         6QVxIj4sVWEtnl3FA9aXKp6QOT9c4/OpSuBw/z2hCVpUWAhiMkUIFTmbzxiXGu4OMxfH
         JpGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoY/RpLnfCLAcptvGzpxiEwKupkZssyYRtAbEc4ROt3gOtYHzWaCHzMeIwovwr69Isu3Fv5dEljvfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDZ1xR30y0kqh/EUUvwNVR/mh6c1McwZeCjOhsfixCWOO2Boad
	C0RGPUVbmlZMEwDlgpsQhuJBmBFQIIJnTSM244rBbRZheX/eAPWnH8vi5CA6ZLLxRq3Yrtkx22E
	qzx/CE6lG8CZXFrsSIhGm7onzZvMKjptSATt9HF5Q2iZRiORPpzCNiUyuajkD2Q==
X-Gm-Gg: AR+sD12GgJrCFED+lRpcwvUqilsYk8+IguFjLwhlDTgkisdj3gnPjWQWRrbOizw2mvD
	hJvmmERfhSl24GfSGKIaHuE8BAB1Nv7mgKljDiR2rtMZHVYK6ZQX+kmYbUvEXgN4RFROsCjVhy0
	AvJcFk0zE3WGf9JzPi29pe7WLTB2V9dJuL18BU1UWSafrsdtwPEyR3cSDES97x9Uw64mAybOW/j
	/k6p1rRE1/mr+MLdOmymUYZFh9yaAGCd2DzSh7vljrA2DvVeSYrO2OAhDBb3K1hEVJvmHnT4p4k
	Pe8sPGZlw6jLe0GbQY5X+WpU1DvelJOhk1KRXBa3Rfct62+VLeyXVbN28fPy1Vje2uu2kwTYIve
	mZWQbeU1kuCRLwOpkQNSrbKY/a/UdEAJqV/s=
X-Received: by 2002:a05:620a:2621:b0:930:f35d:41ba with SMTP id af79cd13be357-9371e334457mr869887185a.36.1787174899586;
        Wed, 19 Aug 2026 14:28:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:930:f35d:41ba with SMTP id af79cd13be357-9371e334457mr869884585a.36.1787174899185;
        Wed, 19 Aug 2026 14:28:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204afbadsm225655485a.17.2026.08.19.14.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:28:18 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:28:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH] clk: actions: Drop unneeded forward declarations for
 clk_fixed_factor_ops
Message-ID: <aoYf8UprO1A3I-53@redhat.com>
References: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 14, 2026 at 04:43:30PM +0200, Geert Uytterhoeven wrote:
> This is already provided by <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

