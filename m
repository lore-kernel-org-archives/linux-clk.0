Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583380;
	b=IjryCZQ3u7v9AquKmDh9maaB/MpDW98eOc2F3M5x+SNHg8dsQAyJUu1kGAOwoZ7zfmHl
	 bJLLW9WGnIcPcpagfULee2/IcK0OeyzFBSurfoPij+KNlVsAlJZlHb9aZALeSf1Ag+0sj
	 T09OjVWi3hqJVo8VdWfoouBDGGfi0J6Zc0PLhhXL6zr+QReCNcdUOkrtqgrpFURTZbk9s
	 ECViR5UcEMlzhv29Bf9CfFDl1Mvp0k+Z1F784Zbibibn46Q18fUWlgfhVULu1W9M5HwoY
	 67EU2myC+xs/6v+BpFfswD/Or835bZt5uwfVHjPtZ6P7Tqy7Eq1wSji4d81FwrHatnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
	b=1KxWWKTC2AvFRc8XUz8Hxj/bKQRJOXb/XzqsZlqRY7jBwfEfuR/iPzyqeyUuJ9W4P8cj
	 nmevkGXAe44MS0VfJ2G2uV71E6TSbUxwC4MU1H0A9kkMSE0S3btwB95AxAedulneS56AC
	 HZkJLKW7i1whx8sLg15URuRqAfi6dBMpbVQpJzCKmEQ5ojlerUM7ncG2bno0Wan6ivxMg
	 NQbFm7zTpDPF9q5MgPXQo0wVutQ0MlxMfZh427SdTBUaKNZUA/ImoVUlOW/ZtqeOsdY8E
	 EiPctoYyPXQQ8hyUWAGy19IcAQxLicHOIlpi8oMPLaQXuvN7+TSAG/e2rITJ5qzQBEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Z4j/Mghi";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC28C606A32D
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 15:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC28C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Z4j/Mghi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so17841025e9.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794583378; x=1795188178; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
        b=Z4j/MghiCfLl4geHxV/1zp0iqZFNnntdJLs/GhAqDGduqb9DsAilkkq7STQnBeZ0um
         RhRvKy/5eCZ7/YOf4I6ESuLz+SNm9tkajr2e8phIKwLpPUNrxEs8ow/NIQakyHXKpUNB
         wPRM4oSCycrLGiF2jbCbowm/BJ1BtJIjJDTObxah1B0fXda8R77uAxdV6HE+5EK+QdF0
         ZQ/ACHOwMrY+sj8numw/aMHMwEY/vMqvifjApBhJUHkH1EPJavyUdNHLq4MyAxwPC7SK
         kmDg9bJ14RbAv6hk4/IhmI1flTTg7vsqzz+2ixhoxgveX2xQhoYUeoYm2BbSsiArcb0j
         7a9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583378; x=1795188178;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
        b=Wfk4D6dnzrzlq5QeVC2vm+5wdwCLvYPFWe8ZPDt0U/MG/hc62gbGsEqlQQNxbIXARc
         kVkQvRE6P8yol9LKdCGhH+id4ZFRa05RjoOYONwjLErdaCNJ5ml527mCUUtqP8xQGjGq
         2HaamltncaH/tQRJF+jffh8F+XOCdjXenIKNgPLOfslRjA20EYjwKD+KPLGw5dBSei06
         aZNCXwPDlRNrKehQWoSqPHnKCN+08r9VRHNsFWOZBVCP14nKlafdygkyIcvgX2LYJZtO
         l/LunzJoQl9BGELsKz71Pfo4sgSbZLLgqJmBCG3KI2klzGEFu8+FMN8YsnmxxLBxHe5b
         1c2Q==
X-Forwarded-Encrypted: i=1; AL+hErFSlTGezDMEr3VfscimMr/KO2wxmxj2xtTN7f2bi6FWjn9FMavkjf2kT5KcfOHmelrHh0SMKqWv34A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hgpaB6Pr6S0N/ee6wKi3qOdvpCfviCyufJ/TIVquvRsHMYoUX
	eJGMsh5uS/hgqXTKIpvwPA1vgoIZPCYQn/NLDuWPNMRmlKN68FTomvmy2nmW4qHAJ6A=
X-Gm-Gg: AYBFou0Un8W2qe3JjHP3yKhSoccuP2KLFkYFH5ZdCcvSHRt34i4mNb8fmoAM3qncnml
	QWyQTPWBJMyroPPkqY+Uj0TgIoM3j2GX40HFQSnPNH2hAfKSsRmzknLd7hZ6sb6MBk8EG7IAFXM
	tsfHnuWAUUgEXNla/HP5wZZAg8y19aX9g/rXcJgWNkz1JR1IEtWWDuu8f/5XCcYB/MJXKFTaUh9
	exLlLFD2rrXr7NvYmZ01w6fegvinCR0LNTOTnWQVY0WWx1prolk8sSASl3nfJyRGTQqL18ErNmZ
	PVGVzJ6ZHARZFPdmnvOvC3XclTPMfyIyC7vDLuljWoEFv+jzs4plo30o+qA21tUzeQN7dvSKNOU
	xcYUmvFbWoJD2WAsftvhjXR2bRmCJ/g64tt0gRQCEHfifnOxFEnProhK1BYIeuzmMuKcz3NMnB5
	R4rlgl5W88LThSO9FlcDtmVSgTVihNfc0Xt8J3zMb4ABovMEcA0wJUHKTu8fT+Og+FnPDdtYixw
	BTJtzE9jVsj+eZ7uWyM3Hh6YIwqgV3ywvuyYuHiVtRyZ7ihALiD05jBlMgL4AjFym1VOyvWUw98
	uhPBE0dKFchbjmCvVkmNgd3ZzCdtjLopx0f1dLV1G2CdrVlV
X-Received: by 2002:a05:600c:470a:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4bb55a44996mr54909955e9.11.1794583378164;
        Fri, 13 Nov 2026 07:22:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm169848395e9.2.2026.11.13.07.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:22:57 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
 <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:22:56 +0100
Message-Id: <179458337623.3308909.8679910347462508471.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=n9gjeLxQD41dq62t9Q1UDoH8EzTxjE0oy5fasIAenSY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnftQNYFjZnu9ws4l/TOn1RRddMPbttkjGdaTOj796rf
 TLVYhFvRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZiVMDI0GWS98twnrmegNbD
 XZYWZY3fVXqXcW6esoxPSy1QcfHdMEaGC//MfS5kr/0fcIBJuSN16412sdN5/5b/Mpj7ZUnLzj5
 3PgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-09 15:06 +0100, Konrad Dybcio wrote:
> On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> > On 10/23/26 12:35 PM, Jerome Brunet wrote:
> >>> Preparing a clock protects its current requirements, not the resources
> >>> needed while changing its rate or parent. A transition can temporarily
> >>> use both parents or access an unprepared clock, and a parent rate change
> >>> can cause other clocks to be programmed too. Raising resources one clock
> >>> at a time leaves those operations exposed to insufficient power.
> >>>
> >>> Failures make this worse: hardware may already have changed when the
> >>> operation returns an error. A matching cached rate is then not proof
> >>> that resource reconciliation finished. Retaining a temporary enable
> >>> reference without a corresponding prepare reference also breaks a
> >>> consumer's normal disable/unprepare sequence after a failed reparent.
> >>>
> >>> Make CCF acquire the affected tree's and parent paths' resources before
> >>> notifiers or programming, and reconcile them only when the walk stops.
> >>> Keep fault recovery independent of rate shortcuts and subsequent
> >>> consumer reference-count changes. Require explicit recovery of an
> >>> ancestor's uncertain parent selection rather than reporting success
> >>> from a descendant request.
> >>
> >> I don't think all this is necessary to address the problem described
> >> here and in the cover letter.
> >>
> >> IMO a new provider API is the wrong layer. The framework already has
> >> the hook a provider needs: the rate change notifiers. What the core
> >> should do instead is fix those notifiers, which do have a few issues.
> >> You are fixing one in patch 1. Another fix, about setting the parent,
> >> was sent recently:
> >>
> >> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> >>
> >> You want to act on some changes before anything is programmed. PRE
> >> notifiers are the right tool for this. The user of this change in
> >> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> >> it, ABORT drops it.
> >>
> >> Also, what is acquired here follows the requested clock. When an
> >> ancestor switches parent, the chain of its new parent is not acquired,
> >> although it feeds the whole subtree after the switch.
> >>
> >> With notifiers, the parent fault state is not needed either. As it is,
> >> it blocks every request on or below the clock until the same switch is
> >> retried.
> >>
> >> Could you tell me what you need from this approach that cannot be done
> >> with (fixed) notifiers?
> > 
> > I'm a little worried about the ordering there, since some device
> > drivers may also be registering listeners in parallel, so we don't
> > get a clean split of what PRE means ("has power for sure " or "may
> > not have power")
> 
> Do you have any thoughts on this? I'd like to proceed with this
> series in one way or another.

As I have replied before, if there are things to fix in notifiers, we surely
can discuss it but, at the moment, I don't think the complexity of what you
are proposing here is justified.

Please allow some time for Brian to have a look.

-- 
Jerome

