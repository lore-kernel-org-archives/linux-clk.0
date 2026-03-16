Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415DD39A802
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673458; cv=none; b=sf493UPTbVFy7OKDl9146hlWnSjCPu17VUmJNOdsRzC289AbLKnLX7gfPUuWBJL5oaWF8MtXqGPz0G4IqC8nmZJMk/inPnGSCaswuRxcvP0d9b4zTsi4dAW7+CcMpr5yj/dPGl9rVqLEdE1xZUsGES8PnH6Ag2E8ewPD3n71Vdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673458; c=relaxed/simple;
	bh=j9s4nW6rffGEhd1lXVR9dLdMc9z31vqESmtM4Se29VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMHViroL33/Ej2k4xmCcz2PHRejcWZxQR5FX/ixnNVUWPasmIf7G5MpH5Dlo8rT4/zu0E/jvNApIeNqmDfFjHDXYp2KHrxMX8nGMP1rXIAcekQTQzF3m1KCOiPqwYbq5+pYoI8xconKkuuHNeM0BIRYFK8bDfs2qe/JRTN2eA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+kwyXBg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMXe1oJn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+kwyXBg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMXe1oJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773673454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Co7Rw9SvGXfO2Q1q4O/QAU8a4dAjFS1ZZErcH+Mevyc=;
	b=a+kwyXBgbCa+R7M+Rqf2agB+CL3pziEoyXUP/cB8nCjtAtxJArA2cjrmRjL44o4IApbJ8e
	r4BA39fsTz4VsWSJpuAtob6OKLs+tKyOeS0lZ9RBXsf9Qr9oFjI/4nAf6qQoJ16KchS1+7
	N4K0FvE88b2qItWnlzHh6wqP1r2bwC0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-y5PB7hnFM4yRlwjy_7uxzw-1; Mon, 16 Mar 2026 11:04:11 -0400
X-MC-Unique: y5PB7hnFM4yRlwjy_7uxzw-1
X-Mimecast-MFC-AGG-ID: y5PB7hnFM4yRlwjy_7uxzw_1773673451
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4d85d619so108281226d6.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773673451; x=1774278251; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Co7Rw9SvGXfO2Q1q4O/QAU8a4dAjFS1ZZErcH+Mevyc=;
        b=EMXe1oJnaWgSZxVnWUiKnSq2oXq1DwgO8ErMLFM6gY5E8C3gYppCf8A1EqPRi8Zik8
         NFAj0stg2bKPCBt0ACeR13efffBhSNKZteOF2IxRkEZ7+//sdWHYL1T7DPTNZocwbU79
         OYdPNlOxMAJxP6fAgBlIjyck5KtquGXp78gQGN9VaU6hSz3Nwtn1X0v8HsHQ8LtMw+js
         JuTdzuO2HQQG32vjKW7ueP3Bp7DW1xaT/f+z35fmFX5Wt0JTF0iBd+tQ5PpusteRIHaR
         2moUTkFBapN0OjCyeZw9jOS+bF5r0H/KlOg3J3GipSdUcloXWhOb30V/lEJlA8oeoKUm
         I0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673451; x=1774278251;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co7Rw9SvGXfO2Q1q4O/QAU8a4dAjFS1ZZErcH+Mevyc=;
        b=W/V7HHdarkFjBBAFiVaLvjqw25JY8NJhv2jPu4KNtOyMJtVvyz91WgzsWr8pHEqjia
         HZfL4dxsXSG7/4nWE8cQR4JPmaFdKETIJIk7PkjIFDfmeeik0tvvwEXL69+3Y7/g6m2U
         uXqYbLscAuDvEyRV6ft6zfJHrANvhP1VCi56FdfQhnooA5ZN/COU01nbMeZhjvFysn9l
         BwBViLr/gHZn+sPOlJ2bOisp5UJpZbR46oixpHOuF1vh/b0nH9ob/0lOkD/Wb+2ImWg2
         pMacQ2KngxnMtwIwRgORo0pwxhtzXZ/DNkfVQ4/24o6rOKJVx+PFo84WewyCtuw2nCn9
         S/9A==
X-Forwarded-Encrypted: i=1; AJvYcCVTXWLcJ596aPgKgMkTy0WN1XIu+9e73nIKiBhaBp6p200MdGrt7pCxNqnNxJinP1U7EILag5lPq3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEVIAdFxybTJsh1jIN+pqvfih3AVhCZbKuPWvBqYQRdzs/om4
	kYFAlNz9hIu8Esl9AQqFBWzhZaCXugxZG9yCBS+CjrMJ1UdpT2YcyvDKr00IE+nswx8siLwv1sr
	HpfaFFBDIHj68+pM75qMAfNB+eoCdyVDDksMZKNsBASfa7415Rr4wZOtkCl6DeA==
X-Gm-Gg: ATEYQzwd8ulzuJko7OVGP8XLKLFYVGWhkpSVsFRAXygewwGjliNJ70Dp/nz++6tn++r
	iQeHbpfA0ksbJ9V5SCuydLeFuzytIR6BS20rZix4gpvPvbRYmwhOlzz4+F/Ym++qDoM7vE+TEe+
	gwuelKNFwgCRQXBRqY7IF8cFhZHLvMYT1rXhV2YOeTsWRV1wNl7lPQMI9RT4fkDXDCYcD1AnwUP
	sTJfKjfOQeP35rBenofYls6JW4RZ15bv+JeRG8NGxxD37HRbwQqTsqg3LhZOni61mYvKif1qNR8
	2g9QNbTYYf3NSlEMO4UFKWcdIlhAKwAIWxGEZVmdCme4PYru/cSWqd4UHJfjpJnR7Ryd/8d9s7I
	qfawt1LMIwwWjF2+HXZ+uflHuxqn03azzb7l8NvsM1n7L2wrQiaprPJac
X-Received: by 2002:a05:622a:244:b0:509:38d2:858c with SMTP id d75a77b69052e-50957e10b71mr185453261cf.61.1773673450628;
        Mon, 16 Mar 2026 08:04:10 -0700 (PDT)
X-Received: by 2002:a05:622a:244:b0:509:38d2:858c with SMTP id d75a77b69052e-50957e10b71mr185450851cf.61.1773673448468;
        Mon, 16 Mar 2026 08:04:08 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-509400d018csm130100651cf.24.2026.03.16.08.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:04:07 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:04:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: [PATCH v15 0/4] Add driver support for ESWIN eic700 SoC clock
 controller
Message-ID: <abgb5OcSFbt3FzjI@redhat.com>
References: <20260303080513.2042-1-dongxuyang@eswincomputing.com>
 <54e32101.4409.19cf56c4aae.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54e32101.4409.19cf56c4aae.Coremail.dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Xuyang (and Stephen),

On Mon, Mar 16, 2026 at 02:54:00PM +0800, Xuyang Dong wrote:
> > 
> > The link [1] provides the official documentation for the EIC7700. Section 3.2
> > covers the clock subsystem.
> > 
> > [1] https://www.sifive.com/document-file/eic7700x-datasheet
> > 
> > Updates:
> >   Change in v15:
> >   - Updated driver file
> >     - Add 'Reviewed-by: Brian Masney <bmasney@redhat.com>' for patch 2/4, 3/4 and 4/4.
> >     - Add space between the name and < in MODULE_AUTHOR.
> >     - Remove memset_p() and commit in eswin_clk_init().
> >       The current implementation ensures that parent clocks are registered
> >       before child clocks, thus preventing the creation of invalid clocks.
> > 
> 
> Hi Stephen,
> 
> I received your review comments on v9. After addressing them and submitting
> v10 through v14, I received additional comments from Brian, Bo, Marcel, 
> and the kernel test robot. 
> v15 now has a Reviewed-by tag from Brian and a Tested-by tag from Marcel.
> Do you have any further comments on v15? I would like to send a GIT PULL 
> request for 7.0-rc4 by the end of this week.
> Do you think this is okay?

It's been a month since Stephen posted on the list, so I'm not sure when
he'll be able to reply. I know he's been busy.
https://lore.kernel.org/linux-clk/?q=f%3Asboyd%40kernel.org

If you don't hear from him by rc7 (or even rc6), then I think that you
should send him a pull request. He'll either pull it, or tell you what
needs to change.

Once this driver is in tree, you'll still need to post patches to the
list, get them reviewed on list, and then send Stephen a pull for that
merge window. That's what the other SoC vendors do.

Stephen: I went through all of your v9 review comments for this driver,
and ensured that Xuyang addressed all of your concerns. The only thing
is that drivers/clk/eswin/clk-eic7700.c still includes linux/clk.h,
and you asked if it could be dropped. If we remove it, then it fails to
compile because of the clk notifier support:

drivers/clk/eswin/clk-eic7700.c: In function ‘eic7700_clk_pll_cpu_notifier_cb’:
drivers/clk/eswin/clk-eic7700.c:1270:23: error: ‘PRE_RATE_CHANGE’ undeclared (first use in this function)
 1270 |         if (action == PRE_RATE_CHANGE) {
      |                       ^~~~~~~~~~~~~~~
drivers/clk/eswin/clk-eic7700.c:1270:23: note: each undeclared identifier is reported only once for each function it appears in
drivers/clk/eswin/clk-eic7700.c:1273:30: error: ‘POST_RATE_CHANGE’ undeclared (first use in this function)
 1273 |         } else if (action == POST_RATE_CHANGE) {
      |                              ^~~~~~~~~~~~~~~~
drivers/clk/eswin/clk-eic7700.c: In function ‘eic7700_clk_probe’:
drivers/clk/eswin/clk-eic7700.c:1313:15: error: implicit declaration of function ‘devm_clk_notifier_register’; did you mean ‘mmu_notifier_register’? [-Wimplicit-function-declaration]
 1313 |         ret = devm_clk_notifier_register(dev, pll_clk, &clk_data->pll_nb);
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |               mmu_notifier_register

These are currently defined in clk.h. This code was present in the v9.

Brian

