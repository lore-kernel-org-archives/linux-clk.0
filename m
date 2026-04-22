Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52408373C1D
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898121; cv=none; b=ctE+jVG1Z9iYdYWIJCLB2sHrYgvUy7CfGDcmHLSSDPu+8DuQJM82hdkxOJg+Hv7O1AVSWUBRyGDnAT1LIolf3HSa+SMsXabyrK5xczxOBcdUkazYLqX0YRUHQEprq5DlZiiGvykhOTObMNtDUGCjAOOEiJ3hjWw3oWbbMJ3BQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898121; c=relaxed/simple;
	bh=NRWSIj1awYbKDb7XDOAYoJaNnOVQ29rl0pbbuAh0CXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vhxn77BmXpTDnu6HbdM4GTMMnFPdC3mA0XMif2R/tLQ+9afQz5e26BwdOMxXc5yachAKp62bfGaqGS3TWsKVKafXgobgIeJz+4dNCSAXoPQQPtaSiPxaJvAykyf6G/Xeqe3pRk+tpSypQiyWqiyWwN955/CrAlJpqPPgKMQI0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xP0Kzkm4; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xP0Kzkm4"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso2015823b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 15:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776898118; x=1777502918; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=xP0Kzkm4cdE8FArVwyURRIHBqxgKXjsZXcCImcT9GabegLK8BxG5yXw7MeEN+gWO7c
         2iJgGQFINJgAKN4BIjv2ysJkJXWZlOQxbXwci6oucu29d124FfVSkzHu8hXbi/VexCWw
         hjwhyIsDf6MUPD82KchjGOPlF86Z5AZ0DIdldkzm/ImvFY5UnGqprIWIN/8ggT8MHI7x
         C7bkUNY/zv9Slh+EsjBw7mM+szwXkfl5dyNd+ipkpHdIFjyG3Dc2g+IoVn7132uP1t7O
         wXQk5Z9aE5FO4TfJFxv4BHrYkyNiuRepGZURqK7AOiZEUE8x6Gx8H0zBwRCrirocoUvd
         v4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898118; x=1777502918;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=gzehWnWG5xbrxpAiAhGHdiSUjnXayHeV1kC27GKqn2ysfJEoStXACoMhyxlVMF1UtX
         +Xs7RAj72jgjI1+L2PRDImzWZsxKV1f3mNbM+prvAUbhmwahVLNoDSzhsInSwPwuzdM+
         9uIYy3TExSUbcpRrGup3Y2v/bYOeX4sEVpuXivbgGWpGYclM/WDQ2dOPeCteR8bMxzkH
         sVZESBqWzINN0qUhFQrs4M4hUy/wx9vkEblCawADgu4vx8MYc9KdC1quuzKRdGIy1ey2
         ywpZF7dbEMElsjfre5tr3mCqjm1mZ7xE0NPy3QaBItk/5oHjsuKVPjvEUVjaNz8VjGYI
         lAEQ==
X-Forwarded-Encrypted: i=1; AFNElJ92dODwsZ88z5yWxWk2b1PS3z7q3DKxflKVCA3CGCU6srbc0wCw3VcUgDrMCOJMF/P/SrQ5q9k8hV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz441/MUc72bHetWqKOCLNie3vJxEq9D+U4bW4i5WT25r6rKBwu
	MQcqRD/Mk7mhzySEZl7RI9ThF/3ndzFtIQxszVzlvd6pk9MYvsJBciZbjhbUJng7V+I=
X-Gm-Gg: AeBDieudHjD9KEsm2dtgkKRgilq1Yc+/Md4UNOu2wGwC8qmiZXfrLw4XctfKv15zWkZ
	PFhvkMfd908MI3Poncxlt2lSrcI74ow48EYt3T5PF94+YxksUhoiERbvRd2HYZxdA4yjtUHzARr
	XDLE14RpgSTLMKTcm1YHC9Q1szi+j29lHPxGrJsfNQxNBcJ5z5Wp7ayZvmoC3+tm+jB/ZxFiBA4
	u7zLxKu0xeGQlo7MDe1KjfuC7ig3Jo05/uwgH7Izy5ajDJe0sY6lXxo77oZL1kK22F6+S/hxrHR
	v808SgWlVUXkHPvATTjZIZJMA5YYJL/8K+H6J+qvfypRgXvhN0EpfF5sFHmoCesZHBQ7zJIPb5U
	ORoLfGj+xNqFz4qxRaejs7iT6kgQ18f90RTrnAo96RJ0iOURiJSTLUrk8Jxyl5t2dk87G2g+JKQ
	JPeZX3XyIkDleHKi5jSHW3nPm9zCebOQ==
X-Received: by 2002:a05:6a00:c8a:b0:82f:98c:1465 with SMTP id d2e1a72fcca58-82f8c8fb258mr26682792b3a.27.1776898118539;
        Wed, 22 Apr 2026 15:48:38 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm21836313b3a.55.2026.04.22.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:48:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Date: Wed, 22 Apr 2026 15:48:37 -0700
Message-ID: <7hcxzqr4qi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> 	Hi all,
>
> TL;DR:
>
>     Describe hardware in DT, and perform the mapping to SCMI in Linux.
>
> The Renesas R-Car X5H-based Ironhide board is the first Renesas
> SoC/board combination that implements the ARM System Control and
> Management Interface (SCMI).
>
> This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control) by accessing the hardware
> directly.  Instead, these operations are abstracted according to various
> SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> firmware running on a System Control Processor (SCP).
> More specifically, the R-Car X5H SCP FW SCMI controls access to:
>   1. Core clocks and module clocks,
>   2. Module resets,
>   3. Power domains,

I'm very curious how power domain hierarchy is described on this SoC,
because one more issue to add to your list is that hierarchy cannot be
described for power domains in SCMI.

I know you're aware of it already, but just FYI for anyone else
exploring this space, I have a series[1] in-flight right now to address
this limitation of SCMI so that we can at least describe this hierarchy
in DT and the pmdomain framework.

Kevin

[1] https://lore.kernel.org/linux-pm/20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com/

