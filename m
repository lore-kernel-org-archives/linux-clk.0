Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8106E13D539
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 00:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775695299; cv=none; b=rlMnr4lHxJoldNm8yCPDK4CP3DpSB7tc5sqi+HVP2aUQDWTFjaNxtPBu5JYXGzSjw4d9tJHM7IScVpaL8CG+O5W8EEVAShJ5hZWayNHJqxz1ni/zSshlJrButYBQwEw6EoIMqduVyMiDt2xfxCHTs94I0LTlClYoOhr7N2DqPcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775695299; c=relaxed/simple;
	bh=+eoQlwxmrJ0yU0sRjyQcMuovdOk6IVOb0BOsgL1htYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQlrL/JidGon+5gYQiFDarP1qbtMhrZ0T0JXeB9JNM2a13PEgDlHXpIHbVjrGfXqi+kp1L6Sl4yXe0Zeb9OLqbeA93RYyq9A+KlMJgF2KZOTsdwBsDYYx6Q62emFAc1GR0j8kkuOxF4EePvDhKd3cgR/SHw/18cdm2GcgpJxRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WTihPDik; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B+P1FK68; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WTihPDik";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B+P1FK68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775695296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V1dvJSTg+CsTdLcj8Y/DkvdTOLgIncY12oieKd2qC/U=;
	b=WTihPDikIQYtZWBzh8P/wifEr4qVeW4XUo8BJW7WrZ80QZdnEvCB4vGcwPlPV4rQdd9jCK
	vRq0qIPalD7PU242MZ4Xdv5AAFda5LrsVR9ELyyBlqrNKVnfO4/rc6X6TIE8qQJmy3xMzb
	kgnCTibNYhc6/MwhmwZhu3YC3se3NSk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-X8ckaxgUPL-aY5CBx0XvHg-1; Wed, 08 Apr 2026 20:41:35 -0400
X-MC-Unique: X8ckaxgUPL-aY5CBx0XvHg-1
X-Mimecast-MFC-AGG-ID: X8ckaxgUPL-aY5CBx0XvHg_1775695295
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d3a0ede6faso78637285a.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 17:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775695295; x=1776300095; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1dvJSTg+CsTdLcj8Y/DkvdTOLgIncY12oieKd2qC/U=;
        b=B+P1FK68VyjTDVaWQ2judsMLUsCNrG9vXMeA8u2gg1PP+1A9xHeJOprDke04WUnPZ8
         YL3e0Dv/nG+lDcUUcBt6vh5ZhcgrfSlOrPKrIZ1kF3NSuLYIMvUoDUmtJGk6BlE1cnF0
         TnEG1QJ/Ng2OdDNvIcldiRlrY6WujFW7JzsEcRDlTMkdHK7n4HDZcS5vOcvRbcaTy+c/
         53eymz7gJGqGmj4zvGUC9sM9otaxRAnBOlKVRwDBZBror78chQeafp8gFCpPtSHItIuH
         eGWJDhxgL6amgFIUv6nV74l5LAwP9JFmXzb3GYC+Q/5/bGWB1goM9AGIE+JajjyaoWog
         PtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775695295; x=1776300095;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V1dvJSTg+CsTdLcj8Y/DkvdTOLgIncY12oieKd2qC/U=;
        b=hryIMZ9kSjRyZMhRY91WdGHyFBHXfjrS/IzwT2kUg+9lAw8PDSUYRSLFYnx0Qtf++L
         Co26D/jlkZeJa1BBlCy5MUXIjWcrR8mwVzcnRYKDQn2b1sXkYxSiWs1de0i4vgZ7Rpqf
         G8zxVNEGhCJcYb9UYOKLdj3bch1gs32yrrpumwtyIaW8CA2Vu3LwXeeBVAT5YLNZuudf
         vBu3tG8JJ4duS5dsWCPf9iw8N96nOWzoE41S4UPULZi6cXwmi6JGNpV+VWxuoeF4yEly
         u4pE3qee0bNxuOqPGnf2fymexWdmo91EzjnV1ExZtryKVQzlYCCZpOOCrgADWh+8mR0w
         K84w==
X-Gm-Message-State: AOJu0YyrXw/X6/luoFzoKPVAiDYVxk56L42lpboQbKLlTTTChD/naW0+
	Yji90vOmTV3njSPCvnh2Y7U4rXqaxyyyOXMLO0ixu42+D6n5pTphI3rjsIYhTid88AmL3ysyAs9
	S5kZUbLgZ+XEMC+Hf3XEbucOmT5VDHkHC/tv6NmAho4bl8NuG3qUnXz271JQLUA==
X-Gm-Gg: AeBDietF/t/jjrLAxVkJJWbDIaK02NnYIk9bM2MdkZO+wVXfkKMeYx0tX7BpNzpVspl
	oV4POtidkJQTjz+Uk/wJseu27VN55VagdGZnIboEXxtZVcsJUmbEEYxELW6RLyIKyDeiXAsiFFA
	XDK5nfo1OoajXDbejCcUHRmAjMS33IC7yIhfQY/TPfA6/NVN1vHzyyW0vDgyhdIujnLzuoXp9QS
	YcLnJukRkJVPU7FNvmVH42kuQaa4yNZo4RNtsSgVPjbNZ2oBRjkMjxPqA94+IKd+tV39hJKZSC4
	5QEYQFFuMwDEkzrY6z5g1plRfMWQZTwgPomlhljbCwBY2P+OUt+9Z3c0llUiRGnR0cFqrcJMNv9
	ctT7N9p3Vel1Njz2Ktsy+qxN0fZFWPgQK7zeMrPOZYZHGFVm9Kz9rbcdu
X-Received: by 2002:a05:620a:1995:b0:8cf:d7ac:1893 with SMTP id af79cd13be357-8d41db4cb38mr3237515485a.36.1775695294926;
        Wed, 08 Apr 2026 17:41:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1995:b0:8cf:d7ac:1893 with SMTP id af79cd13be357-8d41db4cb38mr3237513185a.36.1775695294390;
        Wed, 08 Apr 2026 17:41:34 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8dae66c0c23sm344881185a.12.2026.04.08.17.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:41:33 -0700 (PDT)
Date: Wed, 8 Apr 2026 20:41:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] clk: fsl-sai: Extract clock setup into
 fsl_sai_clk_register()
Message-ID: <adb1u3Ov5_H081e5@redhat.com>
References: <20260409002952.319668-1-marex@nabladev.com>
 <20260409002952.319668-5-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409002952.319668-5-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Thu, Apr 09, 2026 at 02:29:05AM +0200, Marek Vasut wrote:
> Create helper function fsl_sai_clk_register() to set up and register
> SAI clock. Rename BCLK specific struct fsl_sai_clk members with bclk_
> prefix. Use of_node_full_name(dev->of_node) and clock name to register
> uniquely named clock. This is done in preparation for the follow up
> patch, which adds MCLK support.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

