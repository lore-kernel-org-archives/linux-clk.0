Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238B2376F7
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667507; cv=none; b=BlJJESRgsV8p6Vjvpqq8Szz3cq43u+ZA7L0P9/GyIQPTEJxVGVEgRXxTUjKxT9oH/vrAxaegGt0jyBCpuiFxG/hTdlqlF1z4SDArey11gA/i8+VN//cMj6oWkBt7IsnNkO6F99r5qaU5YZuN6KI0cdG4IiY0ItCDy2q1Ozg4bWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667507; c=relaxed/simple;
	bh=gwFnzLYaJfKcCfh+pyp+KlQNtwa+sdrlP9NP/uuwW/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrDFStMRAAAYNbLnOulPUXiyyhywfc1qXqRjUgvBzj7AGIhCzJOkKu4LktUOKbaGey/oKR6mRbQXx2ehHooZOQbI1WhyD9RFIWDwTHty90B6ss9b+VxvBhleCCOtECdWWLoib+OzsinI0t0sMt/5sUUWFhAAH3KNZJsoQoG/o1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gE6kGOSb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gE6kGOSb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so1133110966b.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752667503; x=1753272303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
        b=gE6kGOSbRVKK37QZ1IoM99GrlrsZTYRF5v/XctraxN7fL8J9MnQq7s455JLWYK4N4Z
         eXJKFMXW7Mn0cqoy+4EF4IlUUxki/jVob/VQFG2Ka5u5K++0wRKo3SN15E2+VibPizYr
         fWmr/mJSFM9TuobvxBvUV7s7X2gMCnHaKhrke9gTHeJ+esHDmD6Bner2N1OyFGTZPMY5
         mya8KAzNvgrwvFzoGBz7GszVz5YFd91ZCI2SQN6+En6sjRaWs8RYgJb5hQajVI4pfrM2
         3gqLevuXf/BtPmj1nlurmse3QN2UZ1tiwfJ1ZKbTZ0LFFgMqtGlUAh7mwDk4JIp0keIJ
         3Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667503; x=1753272303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
        b=j3yqEl8sIyvpq01nm9Fqf3lAKKTwG4zZVoBeo4VqBYYuWYyZwmzVEt9QW1xkWw9SvT
         PZAAkKQGL/qRV+vNH57mwPWhkQm9mymxFNTlX6AlusspQG6/OWxj/9fCRJ3oEGH8J9Tg
         H/IdZPuPrR18XTYz+coXDnj0lEtYzsmCW4+XFriQG/4ifgw7mNGlrMfMQL46Dj9W0c/V
         D9VRjJNw7saMKKsQ+gr4Pz+yqj/SCUIyfj688wONG7sYEaP0BT1QCUMCEFwClzRxi8Wv
         74nu68YYe+oazqVfsSZ/E9DW0mVlMvb7H1UigSQsDob/7P8PbhjCbuB5h2YP/78EwqkU
         ZDQA==
X-Forwarded-Encrypted: i=1; AJvYcCVA9jYrWEsvafaqvFr0meI2JVgkUSNVTeCDKEmZDWVUEa2fVaUG7WdJl23+K92+g9woIVAjZK2SvF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/WDIzDFfLZGlJ0fLK9AAcTr+ogvJovm/sD2sN41F3ZZCmOxG
	0jdf/8GVCDqbXn4NFizBM5g8WpMS4W2cae6clNu1mQGyJEBNP9t+Bewfd1yUxIkgchc=
X-Gm-Gg: ASbGncsaTb++oU2yVAjnF6rJsWdIjYNEbtu5cZ/qi8D29eYR8UzaHW+fyfuFqYADdfM
	TednmF+P+zO0aRZu4VAP0LjAs4nK67ZYCnRT+HNj72EaQRoI6R/aEwPvJ2/o9X0KZDjigipn4sH
	FADMm58tWwT9HwbwLTdOsfRrQnWBPj3ptxAqffwyjHg8OVy9mkcZLGebQiv5AZSQ0fzKQQvflBl
	ubrrjpyIHTVSKpANrLNLQHNFDQsYSJKPZ8PYMvnqX9Q4lr84lpsKq9Ndct7SQ7uqlePu7FHEXs6
	Zdg63vYX8NXaCo8Fn5P4tw4zMcDrv0GT6zGZ914cL759SPPddQn9BtTgTkf0hHWyal560g+WFej
	xOpt8J/B+mGghYGgIpUZshOEJ0Iiv/A==
X-Google-Smtp-Source: AGHT+IEHWN0R93F6utf9eOM9iKnjv5S7ssfr5R2MO8UdDd3ai68a3PSrvOh737Pa7gqaj1wFZ0jbCw==
X-Received: by 2002:a17:907:7207:b0:ae7:cb7:9005 with SMTP id a640c23a62f3a-ae9c9af35afmr267572766b.35.1752667503179;
        Wed, 16 Jul 2025 05:05:03 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c15sm1185884366b.117.2025.07.16.05.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:05:02 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:05:00 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] clk: imx95-blk-ctl: Save/restore registers when
 RPM routines are called
Message-ID: <aHeVbInuGbZM7TUJ@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>

On 25-07-16 11:15:06, Laurentiu Palcu wrote:
> If runtime PM is used for the clock providers and they're part of a
> power domain, then the power domain supply will be cut off when runtime
> suspended. That means all BLK CTL registers belonging to that power
> domain will be reset. Save the registers, then, before entering suspend
> and restore them in resume.
> 
> Also, fix the suspend/resume routines and make sure we disable/enable
> the clock correctly.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
