Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503627;
	b=b0OqmiYiSkF2U6y2+ZDc6zdlVdwD1C4olUlW3ix1zBNa1Iibllr4nIOUnpCVyrXisniR
	 t+Fs4ZuTKKwNgSPNHjD7Xep7bubWSXOReLEmH0tIT+MGow1k6JZfBi+4Xdp9P/mmK9YNl
	 X1ffl5vlIcXZSO+fkpLmEDg4cDaSDFoEDU9kLBdbCMFUcqW0X4oSK1h1ZQgWnzkg6j+eO
	 YFDC/UbbbFrUhT21scLoZlQq01aVQ2+/AWIbEfcKRLo/WestUv2EdZgR9xgJ3aDBdSTwI
	 QdYIDQmEdjDQcX4cLTUYQ4abqssBOvnuvljR3TASLDYhNufaE6dy9FrzzULKxxgOQ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
	b=cb9EApirprMi5x4qgHLSad0EpyNED6Ao8i7fBroNiSGrR1nNCW4nd7B1pQQXP4ErLFd1
	 CcJ6VLEKWC9fetA06+bf4b9BOHiBvenheWbt2XyEQiPdLOi47TeM8d41+yTgVT9fESya3
	 qporfpdk1Y4eZhC0+oIaZaBvb25NM73xPSgHGzvz4iDxCluTIL03MQABNGkuCH9F8tI6/
	 LtXE9WPDkE5vKaBainfcI0crXtLTSvqin18x/33cy9ONjSQiLZYWItLi7zlke4m6vEcEu
	 +YRxl5LitcCISLTW9PnjHi5aHvUSq5GspCkD3OFlw07cz22bsd9hukx+hp9W3ICwaQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97162606A32D
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 07:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97162606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso3979985e87.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 23:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503626; x=1796108426; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=Gkbg+gCrbNN3WNgHhi0uF+8i2d7zwOXPgd9yVLZvjD7rxu9P5JeYcbwXcMSyngmxED
         piEUN9osN5BF/fOSx9HZvpLP2t+3P6z7s1p2UXXbrBC0sYY3Ee73LIgXzpOwlPZhgu2V
         6WAqcUqZH0VFmHW81tjVS7UIoCmSXkjpRznEDcbRECjyvVf0DcU3cohcGQuT53Z3D8HC
         iPUS33qsaKBSDlvZ58/yAqUFs/8KJuvkGUZLceRrOCBS+5VM4kTqpv7wJrNUHxljW+9Z
         rGPuHfTNZj124G/RtcA1Unk59fijky3CIzK0AmF2ngpVc6nGAvcolqzzX7edVnmiIbtN
         WBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503626; x=1796108426;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=VK6k9Xvi76wfWPpoSmQBXGRyEVQTQHtIZqU+OjxBT/0a/v8s4G/j0MKIRqLdNEFuaB
         8dQmQqfGIjR0tNATGTSYBmY5H/bQ2toYrm5Q2zmZueCcrUjLPnwm6bnmrrHkJeNotsDU
         HHx7l9gGeyos9rMbBFBsgQqFaffbisjfTqMEayKQec14jQ/TMUb9J4VxfNHo0s1yGFlk
         WQxgTee9TdUzJwMVPvZBWCikwc7TMsFlMi25hdeHRmNZ7S+L3RRtN6A7lprQv76adHBZ
         crZ7MDW6so7QybxcLLPlCTL50FScIz+tzxrh+NEDUresXQ0a75XPI+NCpK5N2TX9T/hc
         Aplw==
X-Forwarded-Encrypted: i=1; AL+hErFnew7NMUsBVkosJrEsGDQyhxz63DywUC/BSAq19QzI62ruIJFebc7y6ihJ6Ja5EBCMBKuaRDS+87s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a6Wtxq4aC+CL/TXe4wkLw5Vcvr0PX+9vrpKUy86V0GoKYZERY
	vroDIeH/14RHXurZtKYJI4/2E50oSzliSsM/KxF1OKXG/LreoXFcTEaT
X-Gm-Gg: AZFdTZeenQ5fcJSr9ecCxRtnVFuRybJqBHt1ALOgkz7+RwDkx8gu27v4JgWDJ6K7W1s
	n/emM5N0aeUfZx9HV1IoxHjTJdkYga6w2VQo604i89VWSoOI0CwUlTzBgK5llnQY4Qu/QJutwMT
	WYF3TZGoOQZiwnvqX4Wg8giBxRmQn4xu1JR47p0JMcbIQsysNEKipF6LeqxA97w6CIkXJVwXDqp
	kvZ5ETBMM+QY/J00MAuoptZcUj/megVBsGfOcnjge/SdQ9zTwmlkymM7B9Auz2vf/BKlC7xBPC2
	nFG+xicSkrl3Qj+7BAsT/+M2azsNnDT2047p7DwQAAlIFvoSIqyJ0W6+vGJvnfYQmbIECT4vS1U
	Je60BtZPl3Y/2ffJSNN7Ib0sUy1G7bEhtZU0M80Gx0CwmLWajITu/dogm0c6AkLP3EGEpYXNyxO
	2gJwsgGf5EsRgMUf332rNA7RkHziAxr2QqEGCdR07dq69Z5Y0FHaDy9FZMZiPcK3CIH94hs1hjH
	WNmO73MfT3kUqINisApdGOrNCxwxySQ/WUpTHDJ9CaR9H6mYc9pLd+AqutHgSpwVhDwVgICZasu
	VWzow4CMUS/mKARTBf9R3G0IId+/TOSbKd2gkZa6XVSTCT79drZIUX8=
X-Received: by 2002:a05:6512:23a9:b0:5c1:ac60:14fc with SMTP id 2adb3069b0e04-5c1bc7c2ad1mr4864356e87.19.1795503625540;
        Mon, 23 Nov 2026 23:00:25 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33b5csm3615530e87.8.2026.11.23.23.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:24 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: Add Cortina Systems CS7542
 global control block
In-Reply-To: <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
 <20261123-cs7542-syscon-v3-1-f1c07a1703f8@gmail.com>
 <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352883.4.9894258481538485863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Understood, and sorry for the rapid rerolls. I should have left time for
review instead of posting v2/v3 while the earlier series was still being
reviewed. I will collect the remaining feedback and avoid another
immediate reroll. Follow-up fixes will stay in the preparation branches
meanwhile.

Thanks,
Fil

