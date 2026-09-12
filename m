Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664BF477E21
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228266; cv=none; b=ci++iz5/aoDUOOI2EntkRS36yO81xBNHr36FxB2O9IDfT0wK2emG0iESu54FLKpumipDu/e0jMDueHaVM7Wi8kltmRBdJZlYNISnp7w3n5SyrYcRfLv9+Zr83hsRLQOwHadp9YZi5ydZUFhG0ifISizYGKqe2k47TyjJ9UhZgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228266; c=relaxed/simple;
	bh=jYjhr9lQehwgsoB55McaT2/qQLnqXw43VwwgAETPBqE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o77YRq2eXwz6YOwppWM2ToSTFOwcCkV1YmxnxUyJ42t2n4qqfQVQTDNx/8NAsbr+ZeUSnSKT0yIuueWWXH/LdAlFbqsisK7WSEHMmT+hpHNoSMnBYWz914T7J8spoWdKVyITGpDzlJZu5omwlvf4NHhluDNP5a3QGI8+BqQPsUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B5Z+lMD3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="B5Z+lMD3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso4105065e9.3
        for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789228260; x=1789833060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=B5Z+lMD3RMMj7NVb/nfYAe9DpW00iaTkHgayOvY05B8q+8RkWJk6fAJAFkb72iwiyJ
         O0loOWoDYolpvpWZ5rVs4/SMg/Hz8YlSiFAsBG050eftDr4RIAPy7rizLvbYtovn9VCt
         bTGVVGCEq9a9FBCXkMQpCMeTXNmsJRuonxg8zcxKzn1lOpAxlhanYHYOks4Edg4VnJ3r
         lMJ6JlJyjpGetWqBo0FiaciOd3HPSKCLtxZvR6XrXercqClTkajUAvcu/sQRUq8JRPHg
         56uZDjTmeeoO38w5PIPxUFX1f+AwvlGvySbq2/PCPeeEJuqXqURiupMHDE6d7SRoV3ff
         uDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228260; x=1789833060;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=aASSfAjodInP5SXEEHLmNRzjEU+uksVCbeGzpszgv0Oi+ml53QETL8KYLJqsu8EKz+
         UjU5hdv5bSpZrgx/tITYfN8HDN22eyMn/484exDN7G2Fcp1LTuC2gWN/S4hG2xIYQX+p
         meYmRn+1luWyPBbgEXge+P+9xZ2XRkDVQleAqZJDYaUqnh8NBil/GPgyzu89Vxjfale4
         d6GAK6UvRVtg7OLugUGGKq8v/wU6u+CMFvgbjsOLPMZO0ZIxjdOfCj/mvxa3I1pQ2YKj
         M+rtTsyvR8L1UEF6lPtmKGCzYmG1afFNpj4JUTMAc8Z4WKJV+Aan8hoEe0U8iWESwZvJ
         30kg==
X-Forwarded-Encrypted: i=1; AKwUvBwr3yZUzMbVzjXXzLzAp8MRybZbci8Grk5X7L8MU1Y6qPAYV3T2iqsvWv6kYqMiX2TzTl+Z2yo/Zyg=@vger.kernel.org
X-Gm-Message-State: AFuF++lKsAhVM9lB7kzNe71G88u4HsbsiECMmWNhlPxl36m/OAqSJf5g
	NP9IMP7x0Nd2/UZ5lLEBP/CEbrzLndxt5MgMA6YH7QTWgEfOxeoQEbtzatUwSwZSlzwjV5ejstK
	N9k4/ytg=
X-Gm-Gg: AYBFou2E6THG710B3sUBwBgOJx2/rurkGm5AKP1DrfuQHUGrXev0BwmkMGBkNLvy4+m
	lnizRGalzcc853bNgQDL1O/jaynRude7pAQbYSeseWXrZwBRV73v4ZObsgJoVAQJaCdp+bJ/MvX
	sE7NgnEsO8rCnHJqgn3ivFWDmeVQNOp1I0ZNIwoqXRFdhXjrlJYUvOcdhUA0/ELfxBYUB6PXS8S
	HxnXpWopmFAweDTHTqnytn55nMrmwgj0BQHzRlzO6pGmWlr8gPR6QT99U3gg41zM7+d3YXwir1R
	LCPjdFCt8hdklEpOIrvikIpU4A+Bkl/MG9nwDihKvOVdY1a9kTowmsj4hFW1adS7kTy0v0ky/gX
	IEeAO3vGlHoKe43JGxpMobruhBedzE2sJOKXVvdbT2Mg5cYwlGLG/HYJbnAwlRgUKM7mBQsX/RV
	oBxFUxHwb5mta05RQoPcoxQh731/odbJUQPEv9cJA89dDjU4eG8CpZkwmwJO2lXLvVry4/e+5h4
	eqlw2FVEAt+lGLXHwNvdW46ENRK
X-Received: by 2002:a05:600c:8b8b:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49e6cbfeee9mr26096875e9.20.1789228260689;
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm154001915e9.15.2026.09.12.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: tanure@linux.com, Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
In-Reply-To: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com> <aqSX-kUvYaixESxe@redhat.com>
 <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Date: Sat, 12 Sep 2026 17:50:55 +0200
Message-ID: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On sam. 12 sept. 2026 at 08:50, Lucas Tanure <tanure@linux.com> wrote:

> On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.com>=
 wrote:
>>
>> Hi Lucas,
>>
>> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
>> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
>> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
>> > identifiable consumers - the three MMC controllers - so marking it
>> > critical was the wrong tool: the clock should be referenced from the
>> > consumer nodes and claimed by the mmc driver instead.
>> >
>> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
>> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
>> > have no single identifiable consumer.
>> >
>> > Assisted-by: Claude:claude-fable-5
>> > Signed-off-by: Lucas Tanure <tanure@linux.com>
>> > ---
>> > This patch depends on the MMC controllers actually referencing the clo=
ck:
>> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
>> > clock must land before this patch, otherwise the boot hangs and memory
>> > corruption this clock caused are reintroduced.
>>
>> This series should be merged together in one tree? Which tree? I can
>> provide an Acked-by if it should go through the mmc tree.
>>
>> Brian
>>
> It's definitely best to keep the series together in one tree to avoid
> boot regressions,
> but I think the clk tree is the better fit since the core changes
> revolve around clock logic.
> Could you accept it ?

No. This applies on top of another change already queued in the amlogic
clock tree. It can't go through the MMC tree at the moment.

This clock is not critical in mainline right now, so
1) I could merge this and it and in practice there would be no
   regression. The problem you had would still be there until the MMC
   change lands

2) Or you can wait for the MMC stuff to land and re-submit this in
   the next cycle.

Your choice. IMO, (1) is fine.

>
> thanks
> lucas

--=20
Jerome
