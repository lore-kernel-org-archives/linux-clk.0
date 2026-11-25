Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564899;
	b=CHQ7scZj8dRQHl2tKqhgvxJBRwHEku6Ql9BrYShCaWt57TmbtdTiYp+nTCfFYTtijUkE
	 z3H9Qz8SuOUHnFCuq7DMX10RdSuORECecOFj14rapXuCKMhxNCzedMbwL20kP2NJB6Tyr
	 jtFWHEyYyfR+wXmA9CrCb55H5yGbAy8WFkvABAwqRIWy9OAF0pdmcAej5xBWKKbEVJ6hw
	 EdTDzbCn12OMoHrZUswDEEeLO6UfYiiPLo5aQlkasKd4IuzTpHDHv0pO/frAu6VkG3TzJ
	 cyFRVAljT2LtoA5//9QDzD8R0esNusuC9N3P72yhgeiCHCaoWuOWJO7d5Z3ZPEHkpzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
	b=EHgvpubf4J325z6/wuNNKkRFJ2QohirhRAlcchP8isLLQYpfytgdu8l5aNuEywQYjfpa
	 1d/3pFw4KAsKKUsP387KYHOq6k566QObBH1mV9171+OMKRbbNfzimRPkNu52FFZWozUER
	 McO0mrd9WHEiEJ15aW+nJbPFT4a615huP0N/8ANriUAW1TkbzgAYg+U+Ps4ZiB5wiFOiL
	 LLprt9kLNQvqLc3dIpDpelvwhiq9zE9wUm/D5wMK9Y7DHEzSSQnzBHRYXVA8kd070Qk7B
	 OubCaU5toqtpNA2+iZfq+rln3hbxAgQ2VsEkimaVlT0j9uCwrfJHgK9Y07M3ZnEmypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZqCF521;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4543606A330
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 00:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4543606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZqCF521
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so10321935eec.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795564898; x=1796169698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=jZqCF521yDr09fUmzi6RgygaLzmw94KaaOKAsaY89oBxs5KQC7DkwM/NuNnQC9xAQP
         EBFLieZm4OZnZCHp6SACkT2ki+diJp/jYfgr4rMm5srpcb6TGFVh44XYpWVz894XA+zV
         NslcaQ6iro3zpioeo7TmXCxnby9VDCBgIBWO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564898; x=1796169698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=fMJiiA4i21btFeQY7nd5sbzUrO+RsizNX+kWFpFTV/c9ZrJkROPpEwsMlHacQe6h7A
         rCb0MyCxuWAT58Ejo3Ub+XD98R2R4njYmk73xxdjzHeWcJSGcBgJkiZNVOdTcakdqSK3
         wGKaRirrWDbxpw8XY/Af1C7s2KOOPdGip5kfSRM0ZulZdPcb8gfWlnNghtD0ZL2dTIux
         CQSjs6PwiEKnrFwdNhoksfo1pFXmA7I/+SQujBNbCWbicwOueiS7yK/pNYJIkyyfFwG5
         0IDyJ7nPlX4C7d9JogOmg/0GZ8rKbASum3e/MAugWIFrd4On360GcoHsJStumI3x+xjS
         6+eQ==
X-Forwarded-Encrypted: i=1; AL+hErFG/5iwQVPhIjuI9qAovk+1T/rvClD5NfnhoQCh46NhRt/aiDPkRr9qCzpyRbDocQKj67PGxX0lgb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bOPeHqaERuYWx9R9eVkwy1HWOZ/qy/uBU+0FQuzctczieCfaL
	khEO0oS6OsEn+/tPEkuDnQeFHWNYipRf9KJ0/w5LRHjaML9Mhx3AHr8fxafja3pDKw==
X-Gm-Gg: AZFdTZdwGaAQ83mafY/gDa4GEZRoUkMQkYEI7DdjgE2vwKWERWqV2yFr5K1nucMwswg
	vXGc0UElvMv8YieaTFZ35gb98rh8zL9+Pb5Xi31/eVHyIS0cgPeOAvyEWThV7cv2+szC0igY/Ul
	VeG+HocmN1yv27i5UQqS0+kBuaO97+Wp8xWbvYlDDBfwrahGFsoKrlnqxCNty+sATY+JKcQo/AN
	5q35rteQH87TECbQQekI8R+0bE51+AE1HKf7nVT4PjY1pvHV/hmZKlE1VzvIFYUVfr6/GGkWpQz
	VBFvLBSqXfl2m0rd6BVi3sF7JHk2/lZKauLpi6SxDw0YJwpU3oyvhTVywDimZ+P2HD0jdxkhU/4
	jFl24XJ72vqI7fkV5eCNzAjvTDkdGqT85nmNwd/RBDil4jMGPEiWEB2LHr2UL190x/MEsfbjedL
	6FtjK9ure33t07PSzAFUcEZRvnwHh8hMicA+D6Zwd5bO7XLPSHK9ThUC6CFDGGNc81Ljxe0+W0L
	aTbfZDL12y9h5D3N3qYb1HbRIvmdv/W7x0XsDXXZBjFkRMIE88FC1ekBsDuMGWG48xcGPTVscJX
	+nScaMGtGLRd3Szb5lizr36/34mec3vViGkAF4YKTQMeSZwAKUVbwFLmqY8USiV12zv8
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr15600970eec.27.1795564896357;
        Tue, 24 Nov 2026 16:01:36 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59652400eec.4.2026.11.24.16.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:01:35 -0800 (PST)
Date: Tue, 24 Nov 2026 16:01:33 -0800
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <awYlXdfJcciCy1Cn@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
 <awXf86suGgKeazZx@google.com>
 <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
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
In-Reply-To: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>

On Tue, Nov 24, 2026 at 10:31:11PM +0000, Peter Griffin wrote:
> On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
> > On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > > Should we also have "depends on OF"?
> >
> > Why, precisely? It's not actually a compilation dependency (I tested),
> > although it's needed at runtime. It doesn't seem like this is
> > consistently done simply for runtime dependencies, and instead work has
> > generally been done to ensure everything builds fine and fails closed
> > without CONFIG_OF.
> >
> > Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.
> 
> I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
> CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
> guess since no 0-day failure has been reported in this thread, perhaps
> it isn't required.

Yeah, I can't tease out any warnings/errors. I had to resort to arm(32)
to get such a config, and I can't even fail with W=1 (I end up hitting
arch/arm/kernel/signal.c -Werror=unused-but-set-variable
warnings->errors first, but...):

  $ grep -e '\<CONFIG_COMPILE_TEST\>' -e '\<CONFIG_OF\>' -e '\<CONFIG_WERROR\>' .config
  CONFIG_COMPILE_TEST=y
  CONFIG_WERROR=y
  # CONFIG_OF is not set

  $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- W=1 ./drivers/soc/google/google-cpm-mba.o
  [success]

Brian
