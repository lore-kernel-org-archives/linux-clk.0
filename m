Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB662625
	for <linux-clk@vger.kernel.org>; Sat,  7 Mar 2026 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772841819; cv=none; b=XjKwlVoVY99DmAZnKl/lUxyznsarvJB5CjDKHlZNfrq91XsMIO1MvRiblu8JOcnJeMzVYEOOsxfR0VnaIPo2POQG+zGuLT1J3rH/2HdmIvLnmPxpTZ2aklOLVYYxTr672p3vndo+YU2V4j6QOdo0vhfbcfl8a0g0+ZRc6N8wIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772841819; c=relaxed/simple;
	bh=oWcX1rbi+AdWO4su3RyE6dplkKurOXEArz/fmLabwqk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoZTNlqXuy8thSOt3Y53pxKF0qsqwgZ1/odck3gtB+mDJ/9R+PQy3t3GWnJR1OZxqNm/OYWUPbbIKT3USGXuUhtbH48DkwRgY1sVOHXOgNijPNo41F/cNtN3HHeUYA5PBPcIH6bt/ofpHhNYLGdXyfytkuWqh5UJYAYsJRJhJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d/MSm/Jk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d/MSm/Jk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so117317235e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 16:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772841815; x=1773446615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcTxU4PyPmyGP0moM0Wgs3S7UBHmJpQ+SiIAGBUuydE=;
        b=d/MSm/Jkxftte8ld0uhpo/88cQEamXosdHjR8U8RViyZHVCX65Nmwc+U5y4WGLaIOX
         vqrggDweFJFIhqYUMkAaw47BkUHnbAXxRTy3xm821Mz1JgSxFxJa00iLQogvfvM/Hm7N
         1pBnQ22njctHhMh0pMyKQ874glDcfUzb8eti9kDfSTxrZnaeDnZc8+7mvs5xgGM7YYPe
         x4mu/QYQRT/S5YpDRzEHpFqR1gaR4IpjunUuqSyrZO7g0RApNrQqpwG5c/X1cHQV8nLu
         MA6Osy6z5mX5N8hiTupuvpyncjEEfwnK8fZsYmFLeHW9PQGAqeyZHTMsYzLbK//B+W0R
         9oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772841815; x=1773446615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcTxU4PyPmyGP0moM0Wgs3S7UBHmJpQ+SiIAGBUuydE=;
        b=Y+fmrAk5ak/0ngK9RDZzjKgqyYlTgQjYPpoKj1x4M+dBLbLv84yruTL4QE0D6GVFDB
         2WOgWMNGW8a1wTidjBvorN0VOCDPzGfdiKcYwak0dqwIKWXNd3OcJber8WTeiagrByRy
         3uv0mUOoQLOFyuySKblf1mMLrSH+ZYUG/Ku1AHBCheXyvAQJmdYa8YVXR63cFBL15FXk
         MCIjWQUVwjs3aOmEiY17GmIIzt4MC9GqWsOYO4VmmEygWYo6LF8nGvjQLOwoDaNd/8p4
         OXY9S5V6kZGpy1f8aTThjYabRdrfbto3WXzc9HjopVRRfNtdFPJb5Np5UbE83NwkRcDi
         iniw==
X-Forwarded-Encrypted: i=1; AJvYcCWnFNPdWfmoAqFVfXvSCW4mYS5+tg0lt9fFzLjY/JrSZZPA9UMnZUvdFG4lW/rrMRpV6FLTKwu2pnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYffxxZ2GY1G8aK+QatCpLloAibeZ/Pj/vhiRr0IOF0figb4zo
	hDQOHQj4av8873Sp/stPHWW9N38yndqCzG+y53Wn2vIN2eDQRCsEVe2w/33/xFrYYZQ=
X-Gm-Gg: ATEYQzwvfJep2J7TDVrb9zsvqA7AWMcqXxONb4USgG0gFcKNkRrrVfh6vN5/Epk775A
	U/WxP7xc9p00oX67h3/YNqvMVXvOcIafXhqbvhpZqpXKI5X1X8DkH5PdxEqQ2p98rqpCQs+KO38
	5XPygRxqGA5aZOPVjV1wx8og6RHO8mC+2vsx5003ma6spvAvyLffhgkk+x/NHSKfZISTp88GgAC
	Wz5jsV1f0y5qMSSxQd5cns1GF5MLn48iCfgRcq89zgLUAQQQMA5kdRbq2jcMqqY61epssJJ7ujd
	W4gjAnoEamNhA+0oubamyFRzWcvveJy6ikeDiIsNICdDiPCiYwgOLOr+IToMnXL4XiWapji+YZE
	wrPe5D0CbzwTx8/dh7D8UTe/ShN9DbPqzwdqiFPy5WFULn+0dX3TUqVaWpEHPPRQpugtH9ZcgoZ
	h4NhuedsS5fQH4pSK1bBiHHvEgdrQBT56YTVyzCQwm909Bl758yCs/GtuepUdGuj36ag==
X-Received: by 2002:a05:600c:4451:b0:483:71f9:37ef with SMTP id 5b1f17b1804b1-48526923bf0mr66400255e9.8.1772841815107;
        Fri, 06 Mar 2026 16:03:35 -0800 (PST)
Received: from localhost (host-79-12-214-40.retail.telecomitalia.it. [79.12.214.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae49177sm7221108f8f.35.2026.03.06.16.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 16:03:34 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 7 Mar 2026 01:06:30 +0100
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 03/13] clk: rp1: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aatsBhNsjb4-c9tH@apocalypse>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-3-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-3-4421dd2f6dc6@redhat.com>

On 13:16 Thu 26 Feb     , Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 

Reviewed-by: Andrea della Porta <andrea.porta@suse.com> 
