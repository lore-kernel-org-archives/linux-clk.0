Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C241DE12
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693331; cv=none; b=INLSkdGs9OXKImNuRic7VTx4rNB0Y7yBaTxGvuvhp/Di6tMF/y5rSripzZFPUzxfjEkJmMwvPsZm/oiCgLNnzyxmzmsDxQC9wW5FruoxG0Wa9OXGmvyfiPHn6tHtqBZo2HM+BQ22KKElqtoCkbOWj5M12wgZk+LhF+8kdCz34C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693331; c=relaxed/simple;
	bh=XfQFoy92YAbJRszFj4tSxRJz3Ixlm75wjudJorUS+Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFGOpXK2NqZnJ0sHBoyLFUXaVC3GuwM234ny3gzbaFBsFEHmHkN+GoBK5U6rah6CVax2turRhXOeyzhd6Q/XOLRZru5QCE9uxQTvex6XtMt29DZLZwRCF9rPKf3KZdcpFWKvIA5B7UEDyAfK0Un3lrapENicap2JOLt7n4b/9tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLaB4z+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjPDmf8X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLaB4z+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjPDmf8X"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fgMN736416
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=; b=TLaB4z+QZfXwOQGg
	Cbtnvbf3oBaDekR0RbQ3A7rx1B3bXGq09su8+IOCAkdrdv1bb0bqc7Qak76tqPib
	eJBFZiq1xDRINkol4ZA8CNUotxcy4fDX9nij1mcfSMRkfqTHQD8LyEMQBelPwjN5
	tILZZv1kCzgzlI4OEm6VoJhgekXBT4w4yT7xH+4XCZFDH3DnL8LP6wXTwcuKxWrZ
	G8GSEZGQ/X0vlWwhO+7nxnBkzXHxjhSGACrh0EkFt0SU6Dd5BEOTsVNGiGzDYMBI
	bGNiySqZUhEeAjFGTQAWIIIs9L8iXOOfrt+j1nyI5H1awzmuCqHqJ1HRqB5X5oJa
	CfaCCw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f2yqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so784238a91.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693320; x=1787298120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=KjPDmf8Xcxn5/UM9Eg1Duke4d8s5R0q3gJiNXCADNUrSyW21eG1M4jeYzhT+U1jmJS
         XJO83Xs8gyyzJlF2ZvGAUie8SWHY2yVQvHH4qr/guqtnDoyePzalHEmW+kJuiAObzIM0
         geJVZRLKU7lv+11abtQ3tQ/KAkgngh9jiBf6xJCCh/GYMxX7Z+oxfp0C2JX1Q8PitQTZ
         0o3oVeHalalGeCJ0ojde2qOqkJKuTLWK/0GBbMXcqvcvFLYZi014SOez59OLmLp+5Uny
         9FiknsFzs2tuc2pxkcV/KtQOb0pJ/rr4kfWbUFwOKHzfQvoSeNqesoG1hu6VzEQ7K3uU
         J4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693320; x=1787298120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=hvlTFqvXfuW6k8tr6yFtA7ViU34bRX/LEiSS7HZeZcagV0qJ2KbT/l1P69EE56jleS
         LGR56USD58iDSRzgYMQrnSLNsF1ixSEZfsR/oSGQYMVZDIL0v4WO2SqCU1HjBfr3rHAS
         lsxXPl5Mnfvnv5r12cLPsWwsMWhC50eae7TO42JE+szZ1hy8X5Pqzt/5FfrppI7AXwbt
         AvUzzlCyHv9rWOv70+U24VT+ETZyesctMZpwUpX2AZEfUdx3CHB29JR5kB15npjfDaja
         mV2W7dRPUMqatiUK1I73frIb4BLdnUBuzHoDOP67oPGqOTynBZgbrHbHWjojCmPKbbjN
         N1bw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0BetlF8hCj0lUATgp3qF4myz6AUT/oqnf/QiUfa3t9IX6ICVZmC2CNle9bJ0vtduPn3UpuJQdf8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1IPguyUiokqQuizmi7N3ErTdlYZMKJ9T98flZiPV+e9tDZhg
	/O2pXNaHBlM1Hc1VmgP6g+34aQexnoFvjR66wsciiaDsM9cpJSIW31ZEf9YWlwb++4v/TtA9nL9
	GSY29ptYujcuY6sbM+JBAOWjNg5pJJ8wTSngyh4Fh7UTGfE5Q2CBpTVrv1cyJl/U=
X-Gm-Gg: AR+sD13kxxKLrUwGG1iJvsRhddfc2mKuHL/Ei/bDbuIMNkcY0Tz7wBQmiZHvBm/3xLh
	ORJaSSrFC3ydsuDPM9zEg34vs5A14F+OuorOfc9vQMBdbkNveluRMTxPNiWEKXKIAxZVN11sXY/
	VGBqOOnDsKABlITRV6KrNzz/VzkrirfjehjFewIJtv1BcOdWOrn5flm5sljiMiVblq3k5PdNI9D
	BC/7TGO1/V0xDkugCfDoUQhbN7zqFHByn7J+9ERI4Ub+SUy4XBsJ31KdxVcxWlN9ptooJlNonOc
	Gkd5JoKCB/Tlx6kv4OOal7l3YVFpAXXmLvszZD6MD313BGLXCim7jPxQYggnZ1fD+VprFKFsBpH
	UPrmtUuGjjIiA1Nt3UI132qBFIGbraA4qd3RyXqiFNr0YXga+EuywqEc9tPSzLbja09gdCXF/Fu
	RB0sQBzZ+XmKL1RzJtUGA=
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197334a91.11.1786693319749;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197268a91.11.1786693319213;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9a1301sm1542712a91.7.2026.08.14.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:41:58 -0700 (PDT)
Message-ID: <554fc371-f3cb-4c03-bb78-9fb5a06c2bc3@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:11:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <anmbi_gXKslOw0bP@monoceros>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <anmbi_gXKslOw0bP@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7ec6c8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qjwxEvNmO9gX62DwepMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: C2bwdPOZ4OgI1h6KyBTC8XbsZfKRzb8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX+Yinc3BZMiP4
 Y5vhLzUbpVQF554uykp+P/AUSvJYQ2QOoIPjl8eYqpr1rCqgpUFAdIu0oQidvJEGnmtA6RMNWVt
 eQgLbh68qF5LroAymKQcqBiV4S15QjvqTeihBtm0AMP75Rd9Xw+MXqb+3ZtHcxKUgG8xTT5F+Cz
 F+6lNVtGnCTcoHt7CUMB7plPOjsq7SUkC6CctEMQBeCBmOpd+c6iK3eH4M3t4yngWfVdt1+wbjy
 +0OaBwPpqj9Zn4BehFHIiisHi0Tf1o6cR8Ql9fepFHCcdTXO0Elc2qjUNruoIk6eBb4iGLAnkTe
 ZSyLb6omJK7r23GTgZC//UCgZhQ7rAhIT9x2TTRRPUfu7FA5uz44wHowAxen3MRUDbMwsSNmxQF
 iwrUG3uFnoOWOWxA4qNn4F86zv0nKOnj1HuHZtjl20Y8+AJhx0l/oFnXiBTnNrzcxzYrH2wkt3W
 IQcbplY19tIfuIrMrZQ==
X-Proofpoint-ORIG-GUID: C2bwdPOZ4OgI1h6KyBTC8XbsZfKRzb8j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX6ItrKsFew0os
 VCSBgdcsAvPhIlWpCAr1cROVuVz/dS31QcvYiLyUy8iOhZWMk9LWbrwtbRfgoQ6Cw3DZevNPKCb
 +hZdQnLsoljBevyVuGhf31a+J4SWSVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/10/2026 3:07 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
>> +#include <linux/device.h>
>> +#include <linux/interconnect.h>
>> +#include <linux/interconnect-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> Please rely on <linux/platform_device.h> to provide a definition for
> struct device_id and drop <linux/mod_devicetable.h>. The latter will go
> away soon.
>
> Best regards
> Uwe

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

