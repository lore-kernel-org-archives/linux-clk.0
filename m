Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8336437875
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342253; cv=none; b=QqsldZTv6KBZgAP3RTSkZm8Y7v90YMuAvSVUhBmUwKZ/gos847UlKuEK7ALGgoOBADKt7nKkClmYoL59gwxzkw4f8GiE3e2GmIBERsq3j3MrR0PBpSIPRId3vKbJt3+9sE5MyKElVmU/AlxorHwU9rntjHq9nDoeMLD37nB/H/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342253; c=relaxed/simple;
	bh=3GUFbaWSljl9zforu3BuYQcd30BioHvA/OWZjXRh66E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lI7QG3sDdTiJ8oXA3NkwUROVbOO2gZ3BSzs193YFzUWvuMyTIVV5pV53fA3KIu2gWtcRJgFSuaBV2Ew8LyfDoO/O3lrJ+hHm4EC9CxS4fgDC7eqsRkncWOlvN3StgFtwj7wBwFhB6CDhZjy7o3IkidmRiHeaO+fvsxtz3hRlKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlPtKx/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWjFcqjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlPtKx/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWjFcqjZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJtW316458
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 12:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=; b=BlPtKx/XxxpKK7H5
	qRgIwOUpdLlMWv1Hty2Ow1YqXT4FfZHu7hpaxt3FgNrKaijKp5c7KslEiHp7I36O
	CNqEEFI/DPhbgH6F1Y2HWyd6jLtmn/L1kM1O5u5jvbHQgRQKDLIY1OQkuUbQ3JHP
	kVBxE0ZbnGP3gUzi8dPDAkdEmZbnbaixay45JhQYWAYWUHC2JdK76St6ZRvOmN5b
	Y9gcAjZulsOMD+uI/eBcpuzsvnH/hoGRwmwYcWCYiVAiwq6kNDyYZ2yOAxoNgzgm
	rnOtAqgYEStA2gn5f92RmNhKEp59ndqfZCc2ax2GZ5pnbW63haTqD47OwMwxL6ug
	Y+qJfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h9wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 12:50:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so7169581cf.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342250; x=1783947050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=;
        b=MWjFcqjZHGRgI6GdaijFdc8n8+CYFE6RFI8JervdnGCU/wFUNGjXvyLsWU4pojaK7g
         4uN0yqVDbJ6ihw6A66gnE9FcS/EOB0yrMEUqNryh9DM2zCjmwe7TU67JbWFKFXJ/d08y
         Muv8gmlJCENgNe0n/+8B5DNBuMkDWHoDQovvFh0L5DDE11BvysKlysLd6fQxKXLgbUS4
         ng39fGeFmoGC8RbQgNS+ukHU3RWIvB5bBnxgaEm+WiRlnDbzZUCisrndFJstO4zcZCC4
         +Yu0xiZwwMn8Pl3uuyIAY2ZqyvUzHu18KVRQhvxULfhKfLkRqKR3zjGI+7mZ2IPWv4V0
         6ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342250; x=1783947050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=;
        b=PurpFkBcwc1SUQTEP0yNLJXQJQSi4CiHnZkdMOMIx5e+BYEELN94i2PXPytqe1uRIV
         eYLRY6HB3MTOPcDH6h5EEeXPRu1lUYTDbq6amJW2KgjOSClU8gmI2JNITK+SjtqA0iou
         jmN5T8Nmm20QHXmoc50H/m+0udNrE1bevcNQQm2sqEoD4jUhKQ/+Ot0zwwfTVRzaAuaw
         DZ6newyPvezlJwoKRV+8ffjhJDQV+ibLjchr3HctX8KWocsjOPx/cothgJwTUZN+IsRq
         8WqYpcRq0oSjOqIli39Ro5pwJMxIFlBR3MzeE9Fg956ttl2NMnxX0VmOkEug1kgt6lxN
         Vujw==
X-Forwarded-Encrypted: i=1; AHgh+RoMEPoUq7QvWRBI2hzeDSHOXDcOHzBtwrsz5ZJpWhgZUHreWgjo2I11szpXfpLrPXwnJzvoi2XfUn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFa+wYzctNKdjSPsqf+ugX5rfKShGB7/SisOLYvhAtc7hnWR4
	urdbQpHDQU+WitWxdd5JKxtWsDcLffpTEE3LDXlyfEbS9oD3LxhmWdIHNPqtcYhv54O4YnRbi9S
	Wr6OYzvAbIPGJ/zavna7h37DZkUiFEQLGv5JhQu013cS5HUCZoccX7yKLIWpCaE0=
X-Gm-Gg: AfdE7clwShjfCqc2mlkNeqve/Pidpm/+R9pxxHbKKkSjloV9LLmZdg6P3LUWQfnYGfK
	VRfgJld6vYR9VDWz+pwgtulRKIvoHKuTOwBLeM8YxCS0gYI0wYjI+lEfuPEdRF0EpOXsTECvnhn
	O88LGUMF1gLSqV6KG2umpXoQbWk2rjZ0dJa4M0moPHcOON/KDAK/HxaA5+oc/oB87xm93dVVUXo
	tmCvLy6qTjUj9Xp8im465YGnvJbEy1HT5XH6w1oRKlcUGJqlQrToseeffKEL56RXfSYsJFU8FrZ
	uWyxglmD5zOki0cXOln9HJ6c/mmCqh5Kow3kTMFvyEKGI0N20yU/wEuB/23ZkUyi4tlvGQvxYCi
	BuOr/f2eqiJKwjpGXyt50GSWXOd6/0Q5Bqxw=
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr87552001cf.11.1783342249929;
        Mon, 06 Jul 2026 05:50:49 -0700 (PDT)
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr87550941cf.11.1783342248080;
        Mon, 06 Jul 2026 05:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm4324196a12.14.2026.07.06.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:50:47 -0700 (PDT)
Message-ID: <91c2d523-206c-49cf-a368-1ec9f864bd35@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX6On+GyllSbx8
 GczESrIlKERDXs9VVtdvbTBsQfoNsD3dUhtvfcfnahDdhzTlb9UOd3gUWDN6NL9VZ8UgLros2nt
 VBfyU2CG/a5bUnmwkejrDoF5so54Bl2kcI0U0glIKDFbx8tZVKkDdWuClqYJxVyeGCsc3RAsPvv
 KehF4ElTC2SAHRdZIcM6omlnd2X8ZgqAvOOu8bmpyHbzhqHb9UAFyqhfOpW5QMa+Q5C4OeoOBZS
 BYoBFs/oQoFsOvqvJYnwpJdWFfPrCXLfN2s5fCsKJMBVgvzlmLmlQGkFzYiLGE4R8WyMwWAJ2G8
 mUsROpX02gIf52zcm2pMZ8fzsKnJhhHd9wLZLIor3gkmppZAOIkO0D8Yo590/fzQuySfym9e/ux
 E0HhGB7Vpdip8q0vvYgiM+rs5URNFDb1JCppDuymfmJxrQHlIynakTb+5VBEu1aZHZECejjK4Cw
 1seBQdfvsZ6GTVY3u7w==
X-Proofpoint-ORIG-GUID: ogPbzhNkhQ8LYwOp2cU9SngUWyjgkg_b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX7OaqRtW9wm0R
 3BwnJ30hWmpy2n40usxXXnD+q+eUjHEBtJCkzUZnwAJ4JNbfd0bVJOcKwTbwtgRyP0uQlaM6UCt
 E7SmA8mZsIZLrW+XpTkkO/CksUZOfSc=
X-Proofpoint-GUID: ogPbzhNkhQ8LYwOp2cU9SngUWyjgkg_b
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba4aa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xUocDvRE5Z91C_HALZkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

On 7/2/26 9:36 AM, Qiang Yu wrote:
> Mahua has a different QREF topology from Glymur. Override the TCSR
> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> LDO supplies on the CRD board.
> 
> Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
> from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
> point its ref clock at RPMH_CXO_CLK.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
