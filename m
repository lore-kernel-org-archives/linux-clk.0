Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289973E1201
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351269; cv=none; b=WNs0hDDXhkX4AA/nuY4svmJiAQ0TEFQO3UkJstXHxTEOnnoTFiuPlsDDdchxUqgEtjyKxzA7p12PPGtq+aTw4Xm/oZ4iMVukUvLgt3TZonSW1LU5FnRXucpj336JcFPCs7xbPE0K3P2UqbMo8A29bqaHFQBYS/s6/7es5sEJSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351269; c=relaxed/simple;
	bh=EPHRfB7I5uH7xIWit20L1zYnCi9wOT2o59aqll9Yfh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMvcPZ6nLj2e2wxPPY91GdfYFCNCFxSwiUuITuBgl9FdkJzaWs3dQ2Ay12E6c//3QZWB0J6XuVR3dvCQaK0uR0w+09pJW7K/Dw1iN10ISH8C1qIgN/EAOBnG3p83BMA7PsmsUnsHBmM1iLjnwNHXPyciZubr8iq6aReIUA3xon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AxvLgQs0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AxvLgQs0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ad135063so78365665e9.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776351266; x=1776956066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUk9+5ugjhG90uPs8bskXfY1v/H6BYvalTyZQcNSMUA=;
        b=AxvLgQs0aTfo5aAuCATMtxqRRyrWZscAlPsA/t41RJ+9AHIVNMbCmUsIeVQrkPCx+c
         w6usVFoGLtuyL6ix3ExuPLMCE2wXopuILo7/owj/aeMHFfikW3URlwtyVLrBFDMGmC9R
         oriTluTZb8rpNneBcFfL6C9opqoTySGkMuV66LC6WpwfOpNLO3JZwFkHqLleCS4QYWsv
         7xNDCB+p2+IISzNFUXDt5Pq74+TRIkbYatSvjOFQ/jusNKjpBs6kIWj/kmd646CZan1f
         vOyVERub8RMzJxxLAGz5S3gV5TaQz7ehlGQp3Jm1jNc58JUIwHLYqgbcY3wChskeG4uz
         ABXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776351266; x=1776956066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUk9+5ugjhG90uPs8bskXfY1v/H6BYvalTyZQcNSMUA=;
        b=CIvSiBKdYNhtOIyRCQ7DX4qXu48U/jfyYH4ZDid2P4b3F16ytt0/1lc1tqT0sFONb6
         aJJZHtn8+ALLv3CORYDX+aYyHKwaiRmq7PcCexV2AQYN2jysmXVZp05AI3aGaDSmCkbN
         5zc0dhTy5NZF9jo1Kr4x4E8iv0h6VTbxojyA2WXXRJrwwC/1bNs0Q8yOsy1QBM8kudI0
         4S5u14RoALzOyuN+UPUSHAXJ5wuwPYvgNXak3A0ccsUtb9jzmL7eXQRk16DociN1SSes
         QeVlIAx7FySB4NTzHW+Cv0/mCuMQvVeNj4d2BTk0N2cCWACkeGn3UCfz7fNywu0jYF7v
         +EvA==
X-Forwarded-Encrypted: i=1; AFNElJ/TilnD8qCqyQf89vILH8znskDfPwy5h6cq08MWhCDNpTrV2wm8PV+X0syrg5Tt20yM2JZ1jzZosu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJntmdZ43ytJ7cfKqpXXd6QHb5fX2pvVETZbXJrFw7ooBGHhH
	OHeJBaAffNR2eJgCDcYmCJthebnXWPyvpCYetNAu29if9DtBx+jsnYlzyZRTAosXBDc=
X-Gm-Gg: AeBDietPletYBGYrpULtWmOt+T9zqYr61oFBjfMqI3xAJCHhz8SUuoS9ZA4BIWbqSl1
	xje+ve4zm1TqMD9zyULM4u8bYQp6E6hRxkC3BhbszxsgPLsGaiPBiOe/NgMsfU4vsPCOE23RO7n
	jRakULZHu0S3sn4t2wmzOCkQMimRDkHioJwaO2CxrNOupZqYkGOSRGDOQDRLkr8+eLHB2NxgoX1
	34FE7wahjvkCXLGepa1ttHMFd+XaGzJykjrPrju70O08GvJ6/5wEs6czCeepxljeTr1/dqRYy8p
	JoZQ2eNEVUGgDPARaFWCwiKhpjios1se57a82Wh1mCrE49X5PKQ//S+8Pvpp7M62v6AWpEkx2a3
	yjI1tr0VjZlIgajm+BY1pWGcv1A+173VIEy2HxXKZvYSUmsCSMNRn6K+yRkeg2Nhq+WFj0iCgC7
	EuZ3HjDkQcuuff914s/aU8LRblvA==
X-Received: by 2002:a05:600d:4:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488d68ab2bfmr302762205e9.24.1776351266415;
        Thu, 16 Apr 2026 07:54:26 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead2decafsm12915427f8f.0.2026.04.16.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:54:26 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:54:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: chensong_2000@189.cn, rafael@kernel.org, lenb@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, viresh.kumar@linaro.org,
	agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
	bmarzins@redhat.com, song@kernel.org, yukuai@fnnas.com,
	linan122@huawei.com, jason.wessel@windriver.com, danielt@kernel.org,
	dianders@chromium.org, horms@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	paulmck@kernel.org, frederic@kernel.org, mcgrof@kernel.org,
	petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
	atomlin@atomlin.com, jpoimboe@kernel.org, jikos@kernel.org,
	mbenes@suse.cz, joe.lawrence@redhat.com, rostedt@goodmis.org,
	mhiramat@kernel.org, mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, live-patching@vger.kernel.org,
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, netdev@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] kernel/notifier: replace single-linked list with
 double-linked list for reverse traversal
Message-ID: <aeD4H8P1DiPQoM8V@pathway.suse.cz>
References: <20260415070137.17860-1-chensong_2000@189.cn>
 <20260416133004.07bd2886@pumpkin>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416133004.07bd2886@pumpkin>

On Thu 2026-04-16 13:30:04, David Laight wrote:
> On Wed, 15 Apr 2026 15:01:37 +0800
> chensong_2000@189.cn wrote:
> 
> > From: Song Chen <chensong_2000@189.cn>
> > 
> > The current notifier chain implementation uses a single-linked list
> > (struct notifier_block *next), which only supports forward traversal
> > in priority order. This makes it difficult to handle cleanup/teardown
> > scenarios that require notifiers to be called in reverse priority order.
> 
> If it is only cleanup/teardown then the list can be order-reversed
> as part of that process at the same time as the list is deleted.

Interesting idea. But it won't work in all situations.

Note that the motivation for this update are the module loader
notifiers which are called several times for each loaded/removed module.

Best Regards,
Petr
