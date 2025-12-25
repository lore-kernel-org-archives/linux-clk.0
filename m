Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9478772610
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766684856; cv=none; b=uedr8xEbGN7XGrhGgqLGDOYlmT4nDqiGiOyjDRnzh13hHo5QlgBQsslrgkrFzb3KgfXARbrJUlxBqxAlwhcQy6XrQJLCaKhWgH0Fun35SMDhljY2ALLq0C2YI9FNoUM3bFdc3fJq+RX1pq38nxrwC/KSkyIS6UXrI7T8SR0HiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766684856; c=relaxed/simple;
	bh=fPiwt7bFT2B7ol6lRMCzjbdE9hXU1E5OUFOHbDORWGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgpYTQvjPRfOuYwZW+sQ58px1jFAxEu5ELij8D2Fy74PmhoF3ZCBpqO6IWp+RkX9GGP9V/MeXl5GAGMmVk8y3s/m1JrFyu9pz4rnShUygvTFLDkV6nidVcCVlW663PXXAxM1kJh3Qm4VYm7uwfEJbhu0+4CuwGTfyUlFtXmyKqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TKuDpY5z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMN83onG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TKuDpY5z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMN83onG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wG4I6VxM3eFd1aSSwTbKPww5ITUYVRbPhiSShA5xEIY=;
	b=TKuDpY5zEem1fsSFYdsHfZJR4TIfyG2bfkAWuQ8JjRkKIVjBrQCetW7WMMEytFBdGoLqGl
	L+vIhuqijZNkT/V6yZA/MIIUFrMVB/NXMUvcIitA0LFY2OQA8T2L1Ktou8I+P7sl9n8eSV
	p+6T97WrOYP6dUIOd6VanhqGOl6RoYA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-Qn9Vg2WdPQ6_cm0SspO9TA-1; Thu, 25 Dec 2025 12:47:32 -0500
X-MC-Unique: Qn9Vg2WdPQ6_cm0SspO9TA-1
X-Mimecast-MFC-AGG-ID: Qn9Vg2WdPQ6_cm0SspO9TA_1766684852
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a92bf359so148891641cf.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 09:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766684852; x=1767289652; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wG4I6VxM3eFd1aSSwTbKPww5ITUYVRbPhiSShA5xEIY=;
        b=GMN83onGhPlrD8qdSNnkUtZJy/AqAxBxlIGugBKcteF24f6onT0ZXzrxI2J9squ/dy
         5Kc6/Qj8NZhA/hpI6jrwOtJnUQQBqAnaON1LmWLKiaOVTiLC9d06+g6mPPFl0Y4TWKK2
         mCvUjcZRyPkRWZn8rGB43Rl4ZkJVwuDLIrObXzfH/sirmRJW86anmn7t3Vw7z57v+nef
         ABCeYgH38tM0uXrK56XNw72a1j17v1qJbjiCiJYt94Nrxmk27pNbAwsksz26qjPFceW9
         Z4AYeDuZzMUFgQJ2cYXPK1RKw5YFTJkTPKhO08JKFB/UrIuGiAqLWHcXuTN2AERbhaqr
         051A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684852; x=1767289652;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wG4I6VxM3eFd1aSSwTbKPww5ITUYVRbPhiSShA5xEIY=;
        b=c/lNseezMnWqsvkhbd91dBklOTU7rrVYF1030JNO+iiclebgbxj3frgZNRMlKFKYRX
         1KxJEZSk1PkPxlIQ/OarIaDfpfs5lJKp38fUo3/+JijkChxsCLqgqsEl0tgVsm9JAL9y
         E6fGNRsOLNeebjda8skwju24gX73qdpdI0veWWXtEI92oxLehiaOuGJgvi8/xIRbfkEP
         zJxyiwuAby3RK/sWxporenvSMiwiViavRzOImBo+dFPx14VIYExs4P7lSFixsqHKbs3T
         ShtAWvBwbEkrlpab6lNADzq3SkN1E+Xvvm22NGgLw65o0fRgtAfEliYX91Exc/eX7lKd
         9JhA==
X-Forwarded-Encrypted: i=1; AJvYcCV6+7sSCuIZSfaXsq37zhWtZEXT+VR6Zjw4696kedtji1J35N7o5oWPWhdxox2hFqY/Sjgx2ofiChU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyICH4Z3iBFyfCDUdXVLcXBEKFzcobpaDpekJwLTbmRcY9/oLr9
	hfOmT0a9DmBpvx6A7k4Awdxzr1LHVeeMF67EnpC1SOyU4wCEaVCp6LAZJEGtUg/PgyaDXWr/sfP
	qkidPglE9CvrkOsfgMOLlYy2e2LrtsNo80RWepPZNCXm1NMuDlBCX+FZ+EO3DkQ==
X-Gm-Gg: AY/fxX4BUyxQl9uidii61OFuolfwCcCFqlEGAjjs2E80ERo3LdUUp/TCxHtzmt7bhuG
	/LP3BdxyVIJZRL/93Mtg0VyiUs1f+OWuvs0n8cWu4tyRylwCA7BfQP1spysTGLTbsSc2hPPxYFp
	ezmopS6Nx4+SZK8TNrw6PQCOcGET4Id5vkhVWQONbYuH2oRljci1ULuJw1tdELe1zdrc42yvw/O
	gsR2Iq8UGKXHIisQnsLdjbGo7osAfpwja87O2iBEq+YWrw7Z49dL1GS9f32y72OihmQXfhKOvWB
	E2yR2Y+vAJ9qAqRGILDqYX9nmYEVxmhO3ycXU6pp6Pj9YmSqxjKttPqpxsKdXdILGZ4nqfdjAJP
	IpAAR91KZRWHIw3hf0s88jVcVxc6q9BHtCNudZa6MSEjv
X-Received: by 2002:a05:622a:115:b0:4f1:acd4:6846 with SMTP id d75a77b69052e-4f4abd9819dmr295761181cf.50.1766684851980;
        Thu, 25 Dec 2025 09:47:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcXKCygnM4kDt881UZTTXHcdEXXO2Rd0nQZmfuJ4gtrB34tIkzBXQRGXaaucUOf12IVpIiBQ==
X-Received: by 2002:a05:622a:115:b0:4f1:acd4:6846 with SMTP id d75a77b69052e-4f4abd9819dmr295760931cf.50.1766684851608;
        Thu, 25 Dec 2025 09:47:31 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64e43asm142776531cf.26.2025.12.25.09.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:47:31 -0800 (PST)
Date: Thu, 25 Dec 2025 12:47:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: zynqmp: pll: Fix
 zynqmp_clk_divider_determine_rate kerneldoc
Message-ID: <aU14sKwiL_wJRUO7@redhat.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Dec 24, 2025 at 12:42:12PM +0100, Krzysztof Kozlowski wrote:
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=1 warnings:
> 
>   pll.c:102 function parameter 'req' not described in 'zynqmp_pll_determine_rate'
>   pll.c:102 expecting prototype for zynqmp_pll_round_rate(). Prototype was for zynqmp_pll_determine_rate() instead
> 
> Fixes: 193650c7a873 ("clk: zynqmp: pll: convert from round_rate() to determine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the fixup!

Reviewed-by: Brian Masney <bmasney@redhat.com>

