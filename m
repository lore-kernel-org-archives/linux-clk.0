Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448813;
	b=VI2In1PWT5D0PZyO5PRtl57pXk+6kMeD6mcExPJms1FhaeOT3C6/+gefjbk4KOXYQnXP
	 y0IGjBGN7MRLkP51gVO4ZP8yaB97w3E/5rcRjZt7DBG0CFXLcAHZheINg3u6+pu22iHYN
	 gmWCILslAMms9mrJ97gBRrqrgNdmnBX9E8c5h+3hYUsRAow85nOc1OcRK3tyhLO4apG8v
	 /b2YqgJNGjChsEgVIp+V2Gy0Zw3nNfWPGjYWP+W1tkQcTmAi1xUHnFT8sKyyjbYuadArS
	 AYKY6/dgRnv07Xg0nWq2FCybG1P9yvGc7ZXgucV5iJHhcYvPoi3+M/uWaHQ75RLhhQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
	b=XlpRO9peaYMWDawbPMKlyPW+ArfC0s+sSAnoYtCyvmadOX3lFgo0vT1bXTRWa6FzWefl
	 2A0/bhIfKXr8Ex8/6QJlRh01KarFIBnsmrBpcu6mwtonKT61MpvO/2056CevNwxOiFhDM
	 xzpHeuWd173pLrE0NeVLFsNMPfvn4E5GYX2+kzNKKObCjAQ6SUx+OgwiUasFlota/zsJy
	 e1wxxyA/F84TWmH7dWH7+kMFeTHz20ouehVMAP77nrxmLor+/DfCWoacPu7WBeFw4g3Qv
	 pNj9v+S/s6Dt13D0oCM8HCLRqiQvOwxyeEM3UXr8ArbAMVBrIepKmPj+H0TC27OeYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fOacZBda;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1E606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE1E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fOacZBda
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19511275e9.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795448810; x=1796053610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
        b=fOacZBda84BFoSkxXuiBVPLK/rTm6IN+e9Ek3paclKzsb1oUy9+exLA1ADv7ZABA8u
         MR1nAkc8ZxaJ/NE0ubq28uS5lLu04ASAN1E81kIwboAxh6EjEAJa57Scn80l7VM9OWPD
         3GcOQ3H75clVIMWmk8NCvi6ucqRuF620LaP6pKF9QKb+98kPRfVBrEXzXt5KK3O4n7A1
         QznDfPcx3UK8HKVzDGk8rremjqB7GvcZ5W1R5HlnN404GpcH1NuKWwVPDhqHknlCM68L
         p6xI23V9vBPx9u7bWGiiiQBxtEpJDgNrSjUnB6a4pv658iUwdKWUpqcRTdQ+obyduqN6
         yhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448810; x=1796053610;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
        b=MLwjOCZowNYBdzOPue8ni2tcfZ1izxAdbunK/eLMQdCkOJcXkquCykTHA1fxS4ttQe
         MW74C+MD7HZA7xkzb5ztrqiMApRsTdSuKoa+iHPVd7DsqO/KHrxI/84o2Zj3wIi4y0Jv
         UkUK87arPck2S27pFQSx0oFydzk/FF97rygHX8n46SKDu6JuuFNF2vOj/OLB7wlfgj6v
         C3u06+8Xgb1PJ4RauI82/HjDbXtHQLMZZktko4Gna8a+AjmTq5fndcSd11xctsU3f0qe
         KB3Dj31G8XxAmPQhpglrya4qu9ZpIsuri/A5UdPhI1DLcSXe3cODfA9osXp5linXY//D
         TzMQ==
X-Forwarded-Encrypted: i=1; AL+hErFFuaV3nwBiC+if6H8EsgpN+6aCNXiv+c3dL9B0LsfzwOMcx75ieKdHfFw9BIVfzB5b2YAeLw1KQsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LvuTGaHnkZ8opNxxSwArqDkbpq15OF8bcd15/rwbYZ9IhG8M6
	HMKP1hOiqXGRjgJC8LqfdRnLqD1wbJNIUArsFQPFPE5DDXiD8+QnhHhtA/fS0cVR9M/kIJ5USqi
	1MAMci7s=
X-Gm-Gg: AZFdTZfGTT5MFucql/xyWZhzYs+/EhAI7+TlULGsK5hBBMRSkI7FGHdTeLHZqmFSFKW
	jqyxjzU1IH3VvSkzpSf7Gc0J7DPEbCTwXSRWuZSEJsVYu0InrWKCR64XVDQPwBkc4Oumu9q9rIc
	/sQU3foKGibXwMCb3TufpTeELKDVIF1ra5LZWfFLbtEQrcnC8hCSawBOl2v5TetVvN+iIKr7zzx
	E2VhDq6J24Y7LGxDco4QlAQIkIA3MYDqIOQnzb+QSrnNvwlvUBWuDQsMJOUrkYq+Dz+3t0vKSOP
	AWVzo8x0fJnhbGp48qy+DpyUeGMAZ8TzhO+o3uknRqEslLa1oOeRZaqGwZ6IXA8u0gYQPcjLDwV
	sgYEhIJdAN4++srFKkieuHXl2Ol0kbyQPqaPyDnBV1SW1PvKoebUqSqUWDxu2Jae7l8Da0ZlaTI
	rroA29KFUqGTeeEDTTkj/jX9oH16KO9bAbSZqFCJMl1kuzkbn9t5+bbRrwy5kMtp7JOHSqkFaNh
	myq9Mksh/8JOL+umUHyo690aaEEREkr1k+p/sjOlYbUwrbhEVfW4Kuuij4jB3Ttu5rg1ykflDGE
	Peua68gZDq2WTZGZnaXFoGuzZX6rM9qlgqYvDJ2pvS5vLIbMlyi+x1pMNg==
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr229426595e9.12.1795448810466;
        Mon, 23 Nov 2026 07:46:50 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm312466955e9.1.2026.11.23.07.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:46:50 -0800 (PST)
Message-ID: <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
Date: Mon, 23 Nov 2026 16:46:49 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
 <20261123103633.GB2959742@killaraus.ideasonboard.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <20261123103633.GB2959742@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Laurent,

On 11/23/26 11:36 AM, Laurent Pinchart wrote:
>> I know several SDK versions exist, and supporting several of them is work for a vendor tree.
>> As Geert's cover says, "While upstream Linux must only support sufficiently mature firmware versions, vendor trees (e.g. renesas-lts) may still want to support development firmware versions".
>> Each SDK version can then have its own DT there.
> 
> That's not how DT works. Please be gentle with Krzysztof and avoid
> increasing his blood pressure :-)

These DTs would stay in the vendor tree, so they would not reach Krzysztof :-)
Upstream would have one SCMI DT, as v5 has one table.

>> If a release that changes ids is already out, it needs a new DT, or a quirk for that one release when the DT cannot be updated.
> 
> So you're proposing that, with any new firmware that introduces an ABI
> breakage, every single DTB on all boards in the wild get updated ? That
> just doesn't scale, sorry. Let's forget about that bad idea, and focus
> on finding a good solution.
I think the v5 tables have the same problem.
As Wolfram said, "the driver is then tied to a specific firmware version", so the same ABI breakage needs a new kernel on every board in the wild.
Either way every board needs an update, so I think the fix belong in the firmware.

I also see technical weaknesses in the remapping:
It adds a second layer of ids on top of the SCMI ids, so each new device needs entries in the kernel tables as well as its DT node.
And Zephyr already uses the SCMI ids in its DT for this chip, without such a layer.

With the SDK DTs only in the vendor tree, what technical weakness do you see in the solution I proposed?
I still think it is a good one ^^

Best regards,
Clément
