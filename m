Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB93B7A8
	for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721573; cv=none; b=haE6eRbMQ1hyvE2PYcAkuHi4/h8s+8X4GqRXBrl3NoJvt+zKKqkZ3IfnGvpj9DMmFfN73jztLlTjzPfKT+ttxp5wCbA2zkhZKDapVoj177kbvPbWZeNpf9boUHZIIhrCbyz9/1qoFbz2QJ2WmfUrfZWhfStFH4q03Epe5OTOaFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721573; c=relaxed/simple;
	bh=qFtJijqCpHzgSR/5xjDIuYSR0z0UDU8dc6Xp1DfZeN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oAq+runfgdnL7A6uAeebplX7PZ7IT1PfNNBs/tSCnYsaRoSZdVGWvEkE4jyGR5bLAPrIK64W/Xq0VTqHoy89mk5eZP+bD6F9nCiSSvIpuHyxwQkYFb4818GM5uMEo5vFZFMt5/jxPfV7uR4zhpRAKv0u3LeJFG3W0w3nTv7vRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BhEd1Sq5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BhEd1Sq5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so44931305e9.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744721569; x=1745326369; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
        b=BhEd1Sq55Ys5m+RpIga88ow/e2pfkRSalatRhC0STvFgJfsmjnjxvUloppzTTlS7zr
         5stoTpQhXyxfm7Nx/ib7vZge0LDF1UcZnTzGTrlGK7DsbJPi0zr0qPSDxDLcvW4u7jTJ
         Lb4iC+4mqZdDHNxMMoX0P29KNRJ/glPClCTeuFM6wRv+Jx7LAEUCPtQhMkvyxTFIClSv
         deAPJNbxrgivZVK/N15BpabCQV3RdgeYxzi45EgdjDryB+Z88AFm9U6zp5B2V+CzHqly
         6lMurjBqVYuBE+Dn6i45ntSfeaGXHK5vfoVTU80aGU/Owfutg9/wx+JgoYej3yygd91w
         sZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721569; x=1745326369;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
        b=eVXJO3Xyk6xP0I5kUenu1W8M3KnqDlhiEc8sgZPt2FMzacja0Jxj1faUCd9W+Hq3by
         FpcImtgvpRLyKiN9zLpTaUAj3ELzdkF0GdrzVxAN7fDQ57qpan8EhiGLIb5kKJI5QhuF
         lOEF8DECgFQUoiIQoZQMw0s+hUoCGVqCmsDRO0olEv6AvN3thVmSCYhUUdlPwFuY0PpC
         ETjBCxKg5uiaQUzMKcOKR+/N7F0QoBOkFMB6fp0MI7rvB3sY0GVICTOkPsOkpgg3hu3R
         GNRka4srJXGQrMRE9ct/vxxPo4IkeBFx/mWC4RezEhqy4veoi1QDPdxbF2xlU40wi+7O
         3vpA==
X-Forwarded-Encrypted: i=1; AJvYcCX5YrglqFt91mrzJVDC0zn4EABhFgKlH7t95Ug4Maf2UghCrZFzEGOj27LusoQ2EZRcb/15feAI6aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTo/qARjvRDzU9IOPLq9Pgrxx9jpfjExdqtSWcfSQn7/hUXlA
	d+gwL98J5PI0IGPHpqjMwfIz7lpE0tkAITuPGhLYy4sdlXXmEf2O/RT+v/WB7q4=
X-Gm-Gg: ASbGncvHUi9VwxjNkT34lCsNUMjQI3b/YCDtLcrH+DUl7bZcyBCaa5BYkElbkRpUtBw
	KM0lc6Cz2OiaftcSpKsKQgXMGuax8se+KHWoYBNV+kuOO94jRPcOE1UYLxRCZ9h+gKndRg5yNwU
	NrYEX+f6xyg7kYviLT62OO0wuqU9ogYdQrxqVNJZLME681ZCOOSf5N0flwADmgIWFdnRL/++uHf
	xQmGO2atb5tZ+WgspbendGWDb8N+CZZQE9XdctX2kAYxN4SsGLOaMZvdr43JPP8QfWe1ioFf46G
	bS0h8FDTV62SwdxmcCpGG/jI5H5mpkEfXwG3zFk=
X-Google-Smtp-Source: AGHT+IE8ZFye7fKJN/Lmt/JH+cGrKzkQSrAfNM/hv/kW4P8wD6rvRDacsRLWQTapc+dkn5240h+uDg==
X-Received: by 2002:a05:6000:420a:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39ea51f5d65mr12661246f8f.22.1744721569233;
        Tue, 15 Apr 2025 05:52:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96e912sm14384664f8f.31.2025.04.15.05.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:52:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021938-swan-facedown-e96a@gregkh> (Greg Kroah-Hartman's
	message of "Wed, 19 Feb 2025 15:20:48 +0100")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 14:52:47 +0200
Message-ID: <1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> Add helper functions to create a device on the auxiliary bus.
>> 
>> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> the same code repeated in the different drivers.
>> 
>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hey Greg,

Do you need me to do something else on this topic ?

Cheers

-- 
Jerome
