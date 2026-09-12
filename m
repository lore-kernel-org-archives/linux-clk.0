Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD75A26AC5
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171356; cv=none; b=sdWkTICDDFFIWxtYCS1KcH93F2vegGZIB8I82qNgxemr418sjoAujJO30LgOgY2ysgoXfum5u36NYdkaVvLLDMXogFYJw57EaY+W17kNBuxXhM1hM1dzkgFGrCwIA01AZ7VCHOUEAGCsBmRLB68+I3e0tvF1XNUm81JodJQx0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171356; c=relaxed/simple;
	bh=8/eHJLDCC1bgnSg4S6WmtVg2N+g/yx6dDLMOK09FGHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzivQabLW//Zo4BrOlV9e8r6MJ+tYWKkzXr2/SVjNB3VXDsWQD+0gEy3yk49UzEkdMMV+BhfpO2KS5LGJoreWs/pkvsOoiFLuv6BTzJSFkFcoIqwUhhZwUkAgDh3N8kCZpJPGHA50eO7wsHseo8RDmREpkeK2Ve2ks+b/Twc0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DpjZO9/I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sq67RQkf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DpjZO9/I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sq67RQkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789171353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vD3rHJHT6IXoplMI1G9PUB23ltzGVExlvF1tjwSpHoA=;
	b=DpjZO9/I522C2D05HBYgzPWDjasIVUXkIhNavQ6xx5o0o2fKhc0njr4Y/GNOqCKdaVnSrZ
	OlYKFWGIjPG32W5NTYoWSozUhFCASdkhROvavd5op011DzrJeLQlFN22Zx9tfPrfbMSbIx
	iTr9xaAFzNh10PjjA8TOhvGbqhxg3wU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-L2k4SFdZPaaWA-qj9UytAg-1; Fri, 11 Sep 2026 20:02:32 -0400
X-MC-Unique: L2k4SFdZPaaWA-qj9UytAg-1
X-Mimecast-MFC-AGG-ID: L2k4SFdZPaaWA-qj9UytAg_1789171352
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806756ea40so1253415241.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 17:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789171352; x=1789776152; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vD3rHJHT6IXoplMI1G9PUB23ltzGVExlvF1tjwSpHoA=;
        b=Sq67RQkfCFNnFCOi12j+923UfcRdbptyNEGqJVL6gaIMWLovydZh2Za2+7Rvt2hwS7
         XnsHJBKKPSGpCmhcAAOKgPt7Ecl4qgClcVRzpv+ETYkOgE37pdfUIGG1+CWrUdxmGoTq
         EEtaGmkTlcdWzt6LzwYtQ2eIqTmDDnKA1GbKs9qjFXhWIi76RDFWdO3aVdn+6+LYdIW2
         TEEH1Za4SAFrozIPvj5CHZZBABj7sHKCV59tAaMedTQyL7YYRTxipiKe5jqwe44j9BVC
         VwIVtL9qwTYhrAHDXtTLCbr4VdFbG2ZR9KHvETYcz61nmONIBjlsJHZqUn9fXPo5PCqd
         XaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171352; x=1789776152;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD3rHJHT6IXoplMI1G9PUB23ltzGVExlvF1tjwSpHoA=;
        b=tHt17Hbf5SfLT2659sZqCMVrL256P9Tqe7s6emV+o9BRdSDBo03rJsfvpq2g+Vu2O9
         Am3ySDzgG/0KJOBgJfm57IMPLDsaNNHyiXU/hUVz4QYXVt8qrGPlPD0j97+NfmLveilA
         9S0p05nyiIGxKvx6VtWNQoLmyvPlk1xvj2drLbHKdGDNpuiCrPu2HE+0Q1vDHp37aeml
         /Y0HHhUngUwCWvsLHfaKa8/1IEE9tCHOV38joocI25ac7b49Oe9+aO5BUkitM+lvKh3Q
         tWsVywpy089hbrhajQ3mDaGFWZ/kWUMJePKOX+OJ4BMTloaofjMl3oUQp7FeQ6KSdW1M
         ytvA==
X-Gm-Message-State: AFuF++l0CxrxURLvTIK5VoLX8jNUcXeDXD7zQZRf6wK5C4DGHBdQiE6p
	NSkl8S9iXwNZd+Ds4wc3okJu1itpOVLxJDOXgIEIfGvzHiYP73pYIaG5GZIxudTD0m9RxQbwW63
	YQ1FmV5mAm3eZC9cv2w1bu4eDgKtqUZPqj/ZhRg2KOFG5VeEKff5c/Q5WZmu5UWj0LnQyDw==
X-Gm-Gg: AYBFou14Qa7cg3yW8tymLI5EvIkqhwQ7LanHm8f0OCd0CBvrS7Em+E6gg+b3UHrFAIS
	ZSFaaj9CKmlR0jtsvwFe8UbHCmAWcqVx3LN0KUBtEMEnjQtP9K3BfXHLukFIUmO4p34XTwMpOR9
	cAWzN4VPDliHxrPFTI8Pwuy7ksRlJYIRgriY3A3uc4ZkKW0yPi4T2cNGPM0rNV2F/ve7BsiFNwA
	6AMm1g/sI5W6PnsJhnjLiQrIOVC91r1cmb7YBClBWufL7llaMPvjSmBsjh4nGQ9O+Pu/3vly4CM
	LWCQ+7O+IKqCgk8CKnqHbwbNQcy4uRS5m3Cf1wBfLD2cm4LxiJL5y++4XTgF/+OOHyXYBwhVswI
	reYhwD1OvfNt/hsMoDTUdsUuJxvzwHHqGmlI=
X-Received: by 2002:a05:6102:f88:b0:796:1ed:ba3f with SMTP id ada2fe7eead31-79601edbb2bmr223317137.0.1789171351657;
        Fri, 11 Sep 2026 17:02:31 -0700 (PDT)
X-Received: by 2002:a05:6102:f88:b0:796:1ed:ba3f with SMTP id ada2fe7eead31-79601edbb2bmr223244137.0.1789171351235;
        Fri, 11 Sep 2026 17:02:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4963fcsm32883346d6.33.2026.09.11.17.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:02:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:02:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: actions: owl-pll: cast delay to unsigned long for
 uelay()
Message-ID: <aqSWlPP4YfAi15rE@redhat.com>
References: <20260904215013.98283-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904215013.98283-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Rosen,

The subject has a typo: s/uelay/udelay/

On Fri, Sep 04, 2026 at 02:50:13PM -0700, Rosen Penev wrote:
> The 'delay' field in struct owl_pll_hw is u8, but udelay() internally
> compares its argument against MAX_UDELAY_MS * 1000 (2000). Since a u8
> can never exceed 255, the compiler warns of a tautological comparison
> that is always false:
> 
>   drivers/clk/actions/owl-pll.c:189:2: error: result of comparison of
>   constant 2000 with expression of type 'u8' is always false
> 
> Cast the delay value to unsigned long to widen the type and silence the
> warning without changing behavior.

Just to clarify: This only shows up with a W=1 build, right? If so, it
would be good to clarify that in the commit message.

> 
> Assisted-by: opencode:big-pickle

The new guidance is:

Assisted-by: LLM

Brian

