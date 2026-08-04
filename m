Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F83DEAFC
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841640; cv=none; b=G2BANAAK+jiuIMY2AL1OVLi4cRojSi6ru0RJ68FzSlXnQRga4/v9hLneoO/jeT9FNgTzynB8Tw/DrwV7erahv2AaPsHgduhlGsKTEMhAFLKwDLSbNSVd4Xm8yqXhBy8xrW3jo5QXO/Xe/Iu+eP9y1Fqe/r65Qm77WpD0zNLrtyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841640; c=relaxed/simple;
	bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRAHNJBpgV0xm2ZLnRm/99ElVosMYesOp08HHdK09p2jygNGp697srMpyh2+rOhnFNIdZa8CioLIKYVkYWoHcofTY19VP0EZz+V+MuLGZLJkgAjWXTK7hbRggi3FWEfLXwTWasJpR0Hk2Zd9aua82Wfw2Uxk835SJi8lnLGvg3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqJlh31x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWm2AQfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqJlh31x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWm2AQfV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CJ4w3373751
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 11:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=; b=GqJlh31xkIGa8tFO
	+g7zKln+8Bg6FCcUuNr4qftrca60TdFNdcwaJWk2ajKoV88fCmbcgssJ0FR8twRb
	wkcKg9aB2l1bTC+ZA+I+k2FySWFrVyCZly/vnmZuwdN8P3QSiQPVFEvu8reTpZPU
	WeMVCrbcM34BtYK9HinwXBCsolbt1ZHRq9/GXG2WSvc7VGKub+Tk8WrQQJmvUkn5
	cXa6l0e2ixD7qg/JcU26zhOS29f6pNebqcdcGP7CvtVukgeqozWOXZZOgjXSlNAv
	U81vBfefEjWdvAle5PYyfXo4PJcbesO5mXBAnOJYPKft+bGINJKVLANGDDUITss8
	UvOPAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r3v7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 11:07:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so56838895ad.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 04:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841638; x=1786446438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
        b=UWm2AQfVV23kVIkFRAeYGlybX9JGRMCODRvkt/mKx7rEU8vg0Sbc3uUfOvzdreFg3b
         iyd23ZOokYA2e2ZjTfKOBA3vgPj1Y3GH2gN0F8ePU7dQ/iqahB/CwXlphJ6IfLXjTkeg
         x5dd4UY924bm+iQOP4HMaEpkGKRCc31jwuFAJmRL4FjzJuc154HhCqwNP9ZfPnAiBlOk
         LB/wIQ9CjEmSz2qj3oLA20znQHZ9bMruvDh9T6QS7l86gd/d5qwF7Y35TLcM6qpsCdiq
         jH+3sleF7m/n4BbxgBa3HeXfpSK4G8tI6uyZ/6RQus71hXCjHXeHw6heZhYhK/IqZF+J
         vYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841638; x=1786446438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+57ytIbP1gqGUE6m3Qw5O0UfJSXQr1K3q8z2wua4Js=;
        b=lPxXtfBsycn5mc+QdPQYXC8gQYTdvs/bgoH+1GA2yJjUZaYjGr8S79yokD+ChklTKj
         k2t3GvNeh6ZLOv1utWpHiGYpFp1eHgn/kJ672n5W3yybunlxjMM4FUjQWft3zd5ENr7y
         J4MgcaA2/Qf5gL7nHFGJ6nh0DJln1ASxnoFc2Izn8ydl565iYlUvuLqUlR5gOuxH9O7r
         ZNwrN68I6jv4wnXsko+JF9HDjKDOX7GGy5+vWoCxzt83DwSnCy0AX/pVGuTBnd74vnTO
         RxTLGpisHmSXnNArCVxHNSnEHvQZNvKF+BzCwWqfFRtVJtGN+YP9k1KtUbX1KNl54c8l
         QLxw==
X-Forwarded-Encrypted: i=1; AHgh+RqOQZPgHQiDQe/tMpJNhV0MlDcemxWgjiDIV/sUwIBbaO40FaHUBEVLBrDZGKcZYZcuopRHNr6jO/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwTBSAy8PJAMS2EJt7xrYqEfCE7IFe6gRUK3QivTkifovimIr
	3JemDDFsyTi/8e3+L1qzEe53fkATPnBraxz/ueg83JxLXsCN3GiP9VzfzO/eKQEUAyy9qhxY31H
	6S6JOsMokhyJdvk7neHyGl+z8BFTrNUUHRaFy8fBzrHNeheW7peiXqBXUAn2hBKQ=
X-Gm-Gg: AR+sD10OxoByIkQkzmZJWauIATNlYiEmqSauK2u+WoLlvFn0j1kxHbWYtBWFc6C6alY
	MlLyNjrV/q37NY++YC4BU0XwN/7b9YCRl0c2H3GC76kjrVwrEGLi2If+ZWillVlcPJBikvVp5ri
	gbjA00s6P3rFlsYA1M60SdkX1MooTgNV+j0uLZwa+k3X75MiAqjjKiwB3T3FKOvq3LvGx+TCDTx
	nMiKDzgVQLh8WBKmKFIEjO9vMbiOwVd2/c1k+z0yU2W6lwovte3xyRKG6NMjLyY4CsoVMZK5LLL
	3HPm9pYVDRn5hCFHG7OGox86R4KHtV9mrDdIJ/MngtP08K6mgLsLreJMYwludDC7gwn3+QOxvKr
	LEf/p4kMLORU8wWr4Fw==
X-Received: by 2002:a17:903:2c0c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d0521e28eemr129825485ad.14.1785841637861;
        Tue, 04 Aug 2026 04:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:2c0c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d0521e28eemr129825115ad.14.1785841637429;
        Tue, 04 Aug 2026 04:07:17 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586401627sm4834476eec.10.2026.08.04.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:07:16 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Tue,  4 Aug 2026 16:37:14 +0530
Message-Id: <20260804110714.2951829-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4f4a90d0-6ce1-4d99-9d9e-74678855a717@oss.qualcomm.com>
References: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com> <20260723-master-v3-2-3d67b79b0515@oss.qualcomm.com> <4f4a90d0-6ce1-4d99-9d9e-74678855a717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a71c7e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=igHyRETPZI50f7faVAsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4OCBTYWx0ZWRfX704Qgf3EKKnx
 0cgzsOteLxUFVprAs1g1didI4ygbsCOAwHf91sGWEUlQntIXkXanrY6u2H9E4d4RyPgjoK49wwX
 HC1sme/NDGX6f+IODgbewADHbK3lGdk=
X-Proofpoint-GUID: rGYqu2f2q6MpOOX2jhuPPN5_U5wPaL3i
X-Proofpoint-ORIG-GUID: rGYqu2f2q6MpOOX2jhuPPN5_U5wPaL3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4OCBTYWx0ZWRfX2P4v1LdZnHs0
 FRTdomCEtaSxYmwxjKy5FqYg90elOLU+mzMhufQ3GZEOJV8wiS1g0wWV9bjSFsGGRF+hk2ytGYS
 dCjOXfDNcaRGN1/SjzFY/ZJCI8Zu85w3QuBGUgVjtwcQ/lZ74ZbPCPWgk+CVwidZNsbsQhJQ+hv
 SVNCyYgqU6fVnGjRSbFIJdGi0bgsTvlrTmZf3HYZwi3+gGnrR66uCwdjkknuGHdNWG+uiu2mzk2
 uy1TwG5lRzC9SVvcygmcDz250AaYvYMnRJ6rSJBUm0AxU9Z5gA+o5odkL0yi1oQ+4IYjCk80SGR
 ps5Ub0ohi3xi90UYhGX8ECZDjlq+HzOWD8qXAMpn59t3bun79ym+0fuRf6uRqRJscnNNzRWKtc/
 aTDXfkMgLHaR2zy1UrITzx6H9wars5XjzQ8pEA0Tsudb2Lhn4CNrN7Tq+5TTAGLg8zjlrqasQb6
 abrLIQ1kQki6jEb+JuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040088

On Tue, Jul 28, 2026 at 02:12:07PM +0200, Konrad Dybcio wrote:
> This patch spans 2 subsystems and 2 separate maintainers.. we'll need
> Mark's ack for the sound/ change

Ack, will cc Mark and get his approval on next version.

> VA_CSR is the Control-and-Status-Register space of the VA Macro,
> the name of the config should definitely focus on the heartbeat
> pulse clock generator within it instead

Ack. Will rename in the next revision.

> Besides, that address space is huge, yet you're claiming it for
> a single simple clock. Exposing anything else from within there
> in the future will require bindings updates, which are usually a
> tough sell. Is there anything else in there that we need to cover
> from HLOS?

The only register block we need from HLOS is the rate generator at
offsets 0xd000-0xd010 (CTRL, COUNTER_0, DELAY). Nothing else in the
VA CSR space needs HLOS coverage for hawi. Will narrow the reg to
cover only those registers in the next revision.

Thanks,
Sarath
