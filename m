Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669237A846
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787334576; cv=none; b=p0Q0UHzE/COqNo2L8xttlrl/k9O4aRV9RPcI4PJvkAZbaHpHwlr/sieE3UEd4MCVd0ozhmlF1WbQptuF5vCxgKJHZuO/RqzTgSyoRgr59xaGgfHaZIwx0fC+Ydruuv5I1DBZ+JjeOvXjobvZwE/AT3X1ENT76UGIyDU91N4f2Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787334576; c=relaxed/simple;
	bh=Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rnDBez6tUKMJx+o0HO9g6YMmgtI7a/N+s0yTywqwXNuLAEcvbpk10ge75yzvm+6yQLAkW/LchwVqR4C2fJjkr9NckOhBGsljERpMACvOZu+8p6uFK8CExQfGxPO9OXkKfcCwDrkXtTpBYSVVFvpqMzg+Ypt4Ht4evnjaMnlCMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjvYsIh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRtE2uds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjvYsIh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRtE2uds"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmKxr2744736
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 17:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=; b=HjvYsIh9w+nM39+2
	QtgvMZjAyuo5GruNJQWlG0ea1Xzu5fmKJ5GFs5Pwk8m/b7D+dPEJnbeRXvba8rqt
	lXQMjbI3sLivnoQQBGoPXBF+qFgIGy9PMX34+jKq7dChP+RVjIHtWEtmhMhx1Cqa
	r5K4W3WgySgePxqyneDRnIZPUlAxJztX3+W1uOnZnfcRUspF6m+voZ/iE/cqdG8K
	60grQQmlHFrRQeThv/tTpMQl70R+8BZteVxppywdZDsFwjKs4rJtfgOqaDxgnoj9
	VSShZxPhxJGSMQ7CfXj8NBOAed9kgXTE6jbd0PvvzFUDotTf1RRQxKpxfZX8lDsB
	CTTwPQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdnax50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 17:49:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1949652a12.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787334572; x=1787939372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=;
        b=HRtE2udsA5GdOAcLySQ/QX7KwQkv0Sb/zJuckTaCrhe59HUMpg//qok984+yabTTny
         Xk5hBVOU/IN7pbidn8WN1weECWP5Z+ctmmdVrrt6SVbKFsmtTjQdbIA6fWCVmWAw5TpD
         fLBtbsFiBbL26WQN5TQgS+UcnRfVdlAUKxRORvavbA+RLim9fAAcjgQB0GYC9vCXfu22
         +9xDesU8fpGJvC3nzl/CTx/Wm8VY3piF6nprGU4+hdZGKM0NVR8ezIF9s2OE54ocFo03
         SOtYcrr9CJO9dq9j3vOPYOqA0KeuVjjMtfHwMm8utxNANaNTTbLkr8KOG3QW5c1UIjtg
         ZV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787334572; x=1787939372;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1v3R6gFVsvXS7LKLNA+syvnWhUGdu0IqSV1HDd9emA=;
        b=IL7Py3JEcHs+JWsL3ilBSDYOnB/qVsnbV5Z8N6dg/+epu6Y+bnB6ivVfmH1S9A2cLF
         bLaoatyRNPXe7j6B1JtO1ocmJP76Ww+MfplaD1jo19/xQhCLXigR3dTIlsOMylRcQvD6
         55KsnrbQn/kfWl3XivxfRqhPalNaOCLDcx1RWxwL08uuvHZuFNhzli20zziuL6UJKOgl
         7tLfKfJJgJuDuWQE55QJ9/QOj3WusFn8ohknDosZnE1J8QcwdJRhJ+lYuVg2tffgG2gG
         h4MLwMdVQs9f/ceG0QrbTmbxaJq6a3PeQu+GE0iyHBVzKXYCIPfbTDeIFFIYDLy25DVu
         hBfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5YkcFvQCFkeTdRS9g+nuk6HGuU/fFQ0U0VUSPm0mdo+rU0RusraBxoM9XgPkXBjlW5XJdXsRMiPI=@vger.kernel.org
X-Gm-Message-State: AFuF++mYLBvzS6uw0xnDZDdUKvexSb0mpuEelEd/MqzJMn5Rj5sVBjEg
	5OXC2FCEbprS2raowFTJA1sCM7VnopqGkPpqTDoquYFvWQnkmqXnjspWXjiXH7+vRMKyAU9v55Z
	uQrdpa5RSJI+1h8a7DYFbKzdDEund1QIt6eliRrYcL6Mf4v+VYoSM3oiqBokQgbI=
X-Gm-Gg: AR+sD12jX8W2m4bsSTNJBStHt9CV+n71DHqa3z8FiCI5XtL1aZVhS7EslGhkW3HDgDr
	5uD/KAEj/BfrfLDuDk1FvWfatBLpK3nwENruEme4+G1aVZ7nlBQAk2QJC3aQaDmSAIdebAClELE
	SJj7vrazkIOqBUQLo6hTDXUGvhu0p2gUIdpD0auugYUFSbakgZlgfcYTxeGcImGuRWfzc0hKlHo
	DoEiGvhsb11kb99ZMvtpkXXFVonOReLg4b9zuM3TKp4ZwRjHfI9ci7OpKYKg3+HU4KAFSqRxzCi
	jn7isX6S61L8rmGgT98+4AK1ygJoOs2xZwXGQolPB0QU7e36nqDkzWr5N98Ab4dt1VKk2uxFuJX
	tOZ822JyKtv4lqjneNw==
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr21129986a91.2.1787334572390;
        Fri, 21 Aug 2026 10:49:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr21129936a91.2.1787334571997;
        Fri, 21 Aug 2026 10:49:31 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb51sm30691047eec.6.2026.08.21.10.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 10:49:31 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
Date: Fri, 21 Aug 2026 23:19:26 +0530
Message-Id: <20260821174926.2096826-2-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <22918a4b-f972-444e-bf2d-f3cb0549b8ce@oss.qualcomm.com>
References: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com> <20260806-master-20260805-sync-v5-1-0ff42e9b6431@oss.qualcomm.com> <ann0rJhd0T6x9iLG@baldur> <22918a4b-f972-444e-bf2d-f3cb0549b8ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDE0MCBTYWx0ZWRfX0A5zjtDo7drn
 sI04S5frT6S2FpskTBECebCrbeXZoquqR0AFWvXa/v9qQ7Vb3+2xlrFqhCu4BPOUuuH7ZHadoti
 0WXTUHS5uEHRorAw1IEuWNTiddhRAfad+V38PDvb90su6AqfROPhzFOs1FBAO9sY+/jrFoNoSyJ
 giKvqGs3bdEWNgGgLQnx/LCGWcR0A7OmCtJlYGFWYchgBh/fwnPgSMuv20POl6RuuYyhQ44mNx5
 DRoDkqTNQGYq/4xQ7CBQEyl2TyB3ZtJqRTO1FwUsS0+UJkBkadc3Muk2J3CV6y+SU7KZBwNaKsa
 iPsBwQmRch0gMGMT/JDxgdP46eW50vy9lX43xAOuawI68Bo4K8VhfDa3XFyrKJfUlanEMBVdYBo
 +DXKdJ16XnDzOzW1mT6WodXff+oKdbV+iTm6U/5z61VaZ0PFrj/Hbzcm/qShrndLgLWKpgOh4YB
 5fpr+dKBvs5qGQCgpmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDE0MCBTYWx0ZWRfXyYpjk7MYasji
 G3OcH40GBrdhyamuRZcAIfDJ+zLcT6KlZv4nyXQTvUQlddE+fMTCf+mDM+XJUATF5WODCdN41yI
 ur/adQxsJQ6bji5zCjKhafTWs/FdxXE=
X-Proofpoint-ORIG-GUID: V6OEChTC92H0bxRCe0Sn-1sEeyC8h2Xe
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a888fad cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ekpy3RUg1yARM-6F3TsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: V6OEChTC92H0bxRCe0Sn-1sEeyC8h2Xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210140

On Tue, Aug 18, 2026 at 03:40:01PM +0200, Konrad Dybcio wrote:
> I raised a similar concern, but it seems my concern was misunderstood

Thanks for clarifying.

> I think we should still cover the full register space

I had narrowed the example to the rate generator subrange while trying
to avoid claiming unrelated registers, but I understand your point that
the binding should still describe the full VA CSR register block.

I will keep the full VA CSR window in the next revision and make the
binding text explicit that the clock provider currently uses the rate
generator registers within that block. The driver will continue to access
only the rate generator offsets needed for the heartbeat pulse clock.

Thanks,
Sarath
