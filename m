Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA3318EEF
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 22:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770156982; cv=none; b=KDG1qMZY+5qMIO+ZqAxpSOgJPiYk9lT8FgqrnaCoN9DxhH91fseT/+2Zf5iLHEY3Ip79eLZtGB4bq8Vdj8julW0HPz3ttSMHBXGu2tu1lbaGplRxCKL7tVRqsjJnDKJxhTbXAyh2N8uvSfIio0/JDJkljJJkiN5A0Mi2eHQX8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770156982; c=relaxed/simple;
	bh=Is5GYtZerD0NK6E8ZXSCoqOK+wq8akx9no2ZxVMphmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToxQE7tyQy6kC+/fUl7ddMAzOwIS59sYrAUxObczYHw/Jhdurgh26hU4VDNSoMAIurn8aqcSSTlWEXTgQ9CG1G9/vD/6fYrGoGAYVDxxaIvkX3s3VHOV4K33vc1Or1hZ4sDA6Ttd1M2wVkQJtN6Ha/qClz1Wlt5gZjIDFQnrM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CNGGKORq; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CNGGKORq"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-662fca4503cso3503197eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 14:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770156979; x=1770761779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=;
        b=CNGGKORqtFd3qtxzeCJZhThoKg8Nrfi+14pIM4nFOXok9C6uQOU0kJBh8Z6FQUWnMV
         0CwzPvF6wDiDrqrQDqouK4LFcbWwm6T9ccEXMdohS3+ZVBkjEnp8TFM5nM9U2XwhFneX
         90Dwo+3Kc2vVqXtZ+vzW+Q7AUaPibt/zqeUzKRD0QjxURzBPdpuNqFfuFQKF0NaZK5NR
         9zWveKK5cHluQuRmeuwfqO8fAL6rzDU4AtJdzdxgcRu2Ks45N90CJo+OHE6VH45agw+l
         Z54HKeifdJeU2dKO8cK6pzz8psKCvWPH59Zq+9yIVB1Fo3E2JiZ427bEpljIAWxD6pda
         2opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770156979; x=1770761779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=;
        b=YURjs6lIgIIz8aSY7IWqPdhk3rgRJvyA+BL7JQJ5/bUJk+UBvZa6bpViNERPiZ7PIs
         hu7UAB/PCiw0VPuMM2S01vIYOSMg5Ja7KlzwWshzJcoF40PGDHpsokFd9nQoN0EvhQXV
         EVLUINXRvkMpwR5VnFKr1+3+c3+pD5izFiGXa9SauyYNHsh26+s6Dp1dRy6SFFQibl8H
         jjzgJB/qN5lzemJedbwE06O+DhyBIDBYrU3qnzRkNQHDmoXGp1poBjqivLqFchK6rtuj
         pYsTrIlPF6pg4QCkjLsJH8Rs++5QFPh8DPc/ilBwhV+Fp0pjq22cFIo3Py9Rd3E3Mmme
         Sk0g==
X-Gm-Message-State: AOJu0Yzmq6wAP9Si2ahTJ3JlEZI9hUP1Mxs7pIF4+nu8IHTchuA/2AiJ
	eJtHCZ7a29hadSTidiubaZetuFnGck7uLUK6dkL64DJSGI3kca+RwwsXlcgQgAGxXCY=
X-Gm-Gg: AZuq6aKjq4CVIt5dgKeNYMcbsTwwLhp505vzENZt+0tz06l5mC2L545onoCN0VdUhrT
	aJMzEOFU6UYnZO+V5JwIDayIfQvyAb+QcVXVC6SQJBgb0ExaMBANRgzha+MYZXOFMZZzHrXleoS
	hii3Vf+r59PNMsA43gI4stdgAQLFuF08al/y7gEtqViDjd2iOH1ZJTzzwUMIK7goKkbhtB1wJHq
	gTfIToX5i+CqJzQsU5FW0xbk+WcRzQtwyOBzRSAPWEDwXMAFCyRhqTnUKo6Qwa6Iw+ov+yeYp84
	l+FM5hytv4IByl/audAyRjFaLIWgaoMRLK3yEtAT4t18XpcPHhGnNo1AzhAxX94qExFqMuQ+ZDV
	NR5mCouIYoHcPkwtjmMe+hDOEpUGaUlC4gfTl+oQ2rH7N5flIHSk3BhZ8weGas511fRAc1k7WW1
	XOy6cYDmJpsVDM6qEQJpjRpVqMqAKWvzvLUpzK3CXgviwswUopBdenilI=
X-Received: by 2002:a05:6820:f09:b0:65f:66c5:c3e with SMTP id 006d021491bc7-66a20d658eemr547793eaf.22.1770156979083;
        Tue, 03 Feb 2026 14:16:19 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:8e13:880:992:e796? ([2600:8803:e7e4:500:8e13:880:992:e796])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a544e77fdsm481769fac.21.2026.02.03.14.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 14:16:18 -0800 (PST)
Message-ID: <37d5b1a4-93e2-4fde-ab56-186d34f8835b@baylibre.com>
Date: Tue, 3 Feb 2026 16:16:17 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-2-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-2-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
>

> +#define CLK_TOP_VOWPLL                                  174

This one seems out of place. It is not used in the driver. It is
a fixed 1:1 divider AFAKCT, so should not be included. (And this
line has spaces while the rest of the file uses tabs for indent.)


