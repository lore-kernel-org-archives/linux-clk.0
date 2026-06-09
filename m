Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491331A7EA
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014062; cv=none; b=B8qOZSDqYpqJPrvRnxws49fSADinkiMHiSszXY2Tg/5JRtWycSSXLdu6ZAXs/WTInln9ys0TtmAFlYHa3sNcU4ZsCNNyujIOuGgANDG9MkuTvvkkpk3WJMYXZeIKruiP5B9hj3qYRVw6UsLvQnaWvDY60weck6XBxY50JGNCu6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014062; c=relaxed/simple;
	bh=cLnvuyhUDxRli1mmxi18YHK8So+HlU3fZNMEkOnKa1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2WSN9F9NVIYEx97CMo4g4ycuFt41JcN0ez9AtS3ighmiY2TySQplOLUhkyxaY8wXqQ4JSdEqVKYcQAty1CkMcmyBE7jeN1AE5EqgIdz49eAE8r6TMNB2gUqz2JjMwwbepKnJ2ocixAG3+/eNrrhTvwIdLsAgZu9LV8RS4W9sQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9gk04SR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jratY9m3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9gk04SR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jratY9m3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClVfh2693955
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 14:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=; b=L9gk04SRsSkyFOgt
	GJBxTVnaGRvQUUfD5VFuUMbKhAuSx4u35f6X+H0UFl15WmnNGaSuh0zRRfvh3YWM
	7cFCt5qnJk5cgwuJSJPlfW7KY2tt/rLPJQgSst3b7HWaAfA30iyrCaLtEhrB5Z8V
	tAwGv3Hj0nldvoeIEzdq5EkaUbvCYJqQncOBRIGwsWAhrQJo6F5yq1h2OKPx5KIR
	+pv5m/vN7WoXHQHg/hImoNTm3lfBS2hptYdzGK5iAB0DxrNUJE8Ddwuhan2C84m2
	lk3inFAuvzlk2NBhNyG0f6iduMEXf23texs93luyyCcS9JcL7IpvlP/qTg1Ng6Ar
	GStpiw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1aek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 14:07:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfe512ea6bso237027137.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781014059; x=1781618859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=;
        b=jratY9m3EJyktTZ0Bdj5Os+P3358g/NjIu63yRjF4aG13sM9RtUsRDOIVd1gQJcvhm
         l1DOaEkGCngmiNRXh7kimsQglm1VMhXUlqA5EEpYrmEwr9eKyJEhWc59b6bMH4ioEyA+
         hxE21xtT1ol7doaaRlCN2JxqaK08+VkHdNtHWJpcc+pYpqtLF2Jf5Tc7XCn/UrUL8LQd
         3V35mYds5THygGaM70jrZ2xiBjMAfTTV77+aX11Nf9o5exmDxniXEvnVySXlR0zfg9H/
         fi9RB7JLlT7f3A0kY4o85UVIfzhQcT7dmnmvLI0Xp5z+YSSBvGiFw70bAMr3bx45nRRX
         Vl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014059; x=1781618859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=;
        b=kvt0OIR+o6E4x7lguBRHHtCekW7RQLitrazkqL50/3Q67JKC8CwrbjfCCg6siOuFUf
         iTfc3ikszT0yNgOfeEMJNtt1aeQEyV2W+iGcTUJ2pgcuv0wixhfDuPWqEUoMeUV0/iR6
         T9EgUE4kIhMz19pgS0/uX7DhjflXmefyVd8xBwyRx2u9Bb6kFZAsa5OGJgggRKquw7Ct
         ie7KuiRRkpX81ilCY9uN2p4D7FbKsh/cmHM8CmWoRWZSdIJV7NIIRRcYhVRX6gYJu7Eb
         Hh2zjK0agLgjzVQXDsbwGjoj9BFZxvELR4/ONKDi0QiCmbNjvSoPmC/OkMf5DTWM+0c9
         +clQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wskSVMokn1sufkmd523GKSl5GS7IzadajqWetgo3KcfkNGV38BfMBptMPeAs693PvtKMN0exz1Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZjxmhAnDLJiWu+Npw5qdGdOE6B8yTKo2Kl9NtsdNiohifETsg
	DmDpup/lFQglEa8vQEc2BlnZvjGZcgJYVrtslLYnnqG+di+ExMtrDTLF+Ip3EpAZnzHGAOLIaqi
	xkpY0BYKFAo8V7D+zhLPFyBl2qLXJW/vZuAWMKAP4xwQiiydcPVkpbv+NEair2eM=
X-Gm-Gg: Acq92OGDOfMdyycBW/fX3raxn4Do8WnXR6h7TftYaJwy+nauDKFV7G68nvIPSJG41W0
	pDo612UL5C7tA+6zfXngFPPE7cShQ/gGgg77TO/xD1eAYTF1eOWXNoVInJjUmFRaZYArzT6oKNO
	Bk+2sNHMyH1TKDcmsqw9TGKUPZDBt09Ac0o2lXq8rXHl/VswzwVh3/wE5Dhxh63Gz1GIgaWjbXt
	ZqdOwrPGfWb3Bm1zecPEKvb+0gTcEqTvH9+QVRAqL86QUomv6OdD+lgzhb3mo2pJ8yKk9FXNWpm
	+GHvDjRORGJtQa3ZCng+IMIG0lR6Jg+OqrGRyRrp1IgfBDGESk5A5wUfaShYVDR57RYb6OjBFXc
	1u8+0EmQscb53OYZ1Cz8Z28gxfUxgeWQVSlqkq/jnrsU5kE9omAAXvw7x
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459244137.1.1781014058982;
        Tue, 09 Jun 2026 07:07:38 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459224137.1.1781014058545;
        Tue, 09 Jun 2026 07:07:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559eee00sm1064314366b.56.2026.06.09.07.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:07:37 -0700 (PDT)
Message-ID: <7e04a133-05c2-4137-9ac4-c4fd4ecdd505@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:07:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <245e1e8c-45e4-426d-9c0c-4c2c0952223b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <245e1e8c-45e4-426d-9c0c-4c2c0952223b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a281e2b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=aQRuXO-KHT3Wpr6myUEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 55b-C0VlqGADiR9x9wMJR-QXWS_3kkwD
X-Proofpoint-GUID: 55b-C0VlqGADiR9x9wMJR-QXWS_3kkwD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNCBTYWx0ZWRfX5pYqZId2ZSAn
 D0+FsX+tJ1DgKFBh/wkiX8xnKmVyL4TOKg93O3qp4BwrzhRVCANnJZBy7Y19byAGlO7rdO3dbj8
 1fVJe15unP/61tLZS9SQUI5eunR+/PsY2pYRaJmpYJg0lQ1zvegbmmtYL/6qTDtMFS6bFMRuHpK
 M6Hfe2xFTPsjB+L3HWBAuqNd75JU2cYIW53pTuEviZo8Ww44orOzo4zlF8W6lbE5eiM7UZ0h5SQ
 kbHKEGHmTGKy3HTEPpjsHd5quBHcGzycekaaWW25cBfuqriXOK9I+LPYxgKHWGXxHg9lWbRDzJD
 oLNtXNNHQ4R/vgU3JwG6TPUb2dVTVg2g4tYMN7pnpD3seuGHXwQMk47K3zKkgPrteenKtIegpFy
 T+MtuPg8s15Wozi8n/k2UySYBEeu7bR21m0KUzFIaZvTpipE+F8tFIJKq58l8Z1IvDYrHvmaBGX
 3+GBdkWI/CKTp4Jvpeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090134

On 6/9/26 3:55 PM, Krzysztof Kozlowski wrote:
> On 09/06/2026 15:06, Konrad Dybcio wrote:
>> On 5/28/26 4:29 AM, Qiang Yu wrote:
>>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
>>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
>>> directly instead.
>>
>> This is the last piece of the puzzle that this series is missing.
>> There's no QREF clkref_en, but there is a refgen that needs to be
>> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
>> (1p2).
>>
>> I think the easiest (laziest?) solution would be to add dummy clocks
>> in the clkref driver and only toggle the required regulators. Another
>> option is to defer back to individual drivers (such as PCIe QMPPHY).
>>
>> I kinda like the "one central node to drive power" approach, but I'm
>> not sure others agree, since it stretches truth just a tiny bit
>> (although not as much as one would think since there are *some*
>> controls for the transparent-to-the-OS hw pieces in these paths still
>> in TCSR).. Dmitry, Krzysztof, would you object to that?
> 
> Not sure what you ask here... the tcsr will get the refgen supplies and
> that's all what is needed from DT.

What I'm saying is that there are always-on clock branches (no register
to control them) which go through controllable repeaters (with a reg in
tcsr, although we never control them since the reset state is OK)

Both the repeaters and the associated refgens need power supplies. My
suggestion was to take care of that by adding "fake" clocks. Currently,
we have e.g.:

&usb_0_qmpphy {
        vdda-phy-supply = <&vreg_l4h_e0_1p2>;
        vdda-pll-supply = <&vreg_l3f_e0_0p72>;
        refgen-supply = <&vreg_l2f_e0_0p82>; // the other 1.2v refgen is missing

        status = "okay";
};

The refgen supply is deferred to the QMPPHY node itself, and the
repeaters on the way are ignored. The "ref" clock points to RPMH_XO.

What I'm suggesting is that we add "fake" (i.e. uncontrollable) TCSR
clocks, such as the inexistent TCSR_USB4_0_CLKREF_EN, to which we can
link the required regulators, both for the repeaters and the refgen
source

Konrad
