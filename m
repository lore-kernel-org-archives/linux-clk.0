Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D62153FD
	for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441791; cv=none; b=PEq+wIWBaG0J2A4/eQw0PihKcuinwOSPn1oawKrY26DC2QvfHK7RzDhpEjewqLQfEsRLlz9sU4fvXBre371ZlX/lmNLiO6wU4IHU4YojCFRKPjqtS972325ac1Am0yOoMJoyC75Hm3fgjS/4gfjggeMgIGy5gRaLTvdvl9WPw5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441791; c=relaxed/simple;
	bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XC+QFPDCicDcbHhGu/v6NVy46cTNyn9Zbphq1fgSf93cgKL+1Ns1xT98hIuCyIHszUoGVO8q96qL5b+DMp/GaQvoRer9eBnGTZFNkYIgsVeX88OxU5NIbVmi/n3GTwEkoOAd0ss7OLWih3euKfxsAkwoaQEp8lSp6oLIdwrYGv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=baYxDlmE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="baYxDlmE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f22fe8762so306626f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441787; x=1740046587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=baYxDlmEYIYvjfbu4jxW8q+NipL4xiZzYboYksA07dYyC/9+JEBKzgZ121waBA1QzK
         TTceqAW87LKEBjGo+NGh/r7H5TwGcK3hjbiQMnJdKL7Uo9smDwE8zpaZCJRHDvgsLSPx
         hUCWXEx+872+qjNfzWL42GE55KPXCCbsloGM+ZMmxG5AIOtXthF2sreQoq5aq7FoovhB
         5HBUIFPQVDaNQtgtoZAakH2ejW5TyNE+jD4zKdWPVCcUSW6aOxFgk8VGJfQATww5mQaU
         vKoNZJIYOFk4LRYA9skQPjAPwngn7lS3bpHUeJntCndndGpgHev2xXY8LigkonNYcOY2
         ayEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441787; x=1740046587;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=YHX1rHJYQDBr90fBOTRErI8wKVG3qrdPkN75RDnR3ZQdpf5kaOtWKd06pA9YupuAXU
         O6drpzapf4SxqmkJpWkLhcAM8GxoReGlVZXjqI7OOOgNqSs471bzly3uoaypw9OlBk+/
         uDbouzYx5xjiNEfD/zKF6OwT7I9hTibu7nM2QkvXBLsFpvNk8AUYYsFVZMyt5rGHMlJf
         eCwN8VTXi4Im+3ngYC/yF2irmuawSbMUUXJCgAIosWG5ppjm0+nRgdVh5tR50wAQkkfj
         mOhguLP9BjKCMgC1InHLkNEarNNkADzqpGdqjovibCwE8FPHlKS2P0TU+0wS3UrirI8u
         HQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCXFLUCFKzdP2+wnxy+mtd4ivSNauW8pH+LEi8RQZuZSqnq5kqFM3YNCOlS15rnpa9t0PmCbjiUiZdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46PFyLSKZFvv7NQwhu+vG3eQQOwSvoawVSba0qKTe8KNym+to
	0nvwMSc/tTCT8PnrDjLnu80GZq/VocCyMtGOmIqQ99FZB2sOG5es7QThu+6xhig=
X-Gm-Gg: ASbGncu4Vz0xvVi2kG4BI3QkdKBzlIs3boRClyNqB+w6zX43Dmxku+yLWD+R5xvjTQC
	QoETv67hQtxwugn/IRAx1vLvVvVpOxtQ1AM2HSxeNmIw0TpM8dhGq0jemIL/IgjNne94du3HKF2
	pRbLCA30JYS8oDDhOkgpCyVye5kuJjWXH2Wv7qtYwrnR59E2w/MZEqLew6y5XJufDdE4JISrZx7
	XPPF5+jsk27dAd7DwcEJkWqSwfMwE7x3LLqGfOLHMGoMnxn2mhAcDTFBdSNuK2YQyFsir4aIw39
	7VzFyAevEGrwYw==
X-Google-Smtp-Source: AGHT+IEffmNN4Pb9+ARCo3GKUiuLAJbsEVpvuLGQpUwyPZc6Fg0ln2kIswpBpy9K/UypDXBJlkii1A==
X-Received: by 2002:a05:6000:1884:b0:38d:d8d1:a4e1 with SMTP id ffacd0b85a97d-38dea3c42dcmr5386478f8f.4.1739441787185;
        Thu, 13 Feb 2025 02:16:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm1451341f8f.94.2025.02.13.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:16:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael
 J. Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Arnd Bergmann" <arnd@arndb.de>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Conor Dooley" <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Douglas Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory CLEMENT"
 <gregory.clement@bootlin.com>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Abel Vesa" <abelvesa@kernel.org>,  "Peng Fan"
 <peng.fan@nxp.com>,  "Shawn Guo" <shawnguo@kernel.org>,  "Sascha Hauer"
 <s.hauer@pengutronix.de>,  "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,  "Fabio Estevam" <festevam@gmail.com>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  <linux-kernel@vger.kernel.org>,
  <linux-riscv@lists.infradead.org>,  <dri-devel@lists.freedesktop.org>,
  <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
  <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com> (=?utf-8?Q?=22Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun"'s message
	of "Wed, 12 Feb 2025 15:53:38 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:16:26 +0100
Message-ID: <1ja5aq175x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 12 Feb 2025 at 15:53, Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wro=
te:

> Hello Jerome,
>
> Why the " - take 2" in the commit first line?

Because, at the origin of the dicussion for this patchet, there was
another change doing the same thing [1]. The change was reverted do
perform some rework and now it is back. It was another series entirely
so v2, v3, etc ... did not really apply well.

Just giving a change to people using google or lore to distinguish the
two, that's all.

[1]: https://lore.kernel.org/lkml/f9fc8247-331e-4cdb-992e-bc2f196aa12c@lina=
ro.org/T/#m9ab35b541a31b25bdd812082ed70f9dac087096e

>
> Thanks,

--=20
Jerome
