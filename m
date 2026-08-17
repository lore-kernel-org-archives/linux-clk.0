Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675A4252BC
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973094; cv=none; b=sk2Zbh49MUS4Y362ejUZqjIaOdppQO93r3W/AheQfhXKDGL2Ez01x3TGO3rFSLY8TC+RpUDnWWN5xP+Rds1pdqqYP11TdqW/M2Ge99I8T+7kKuoTAMHArfb27yEah4quX7n0cWA1a20b5Djb2WJ/PivvnnsJXc1WKepRlpvvNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973094; c=relaxed/simple;
	bh=F1GSXwfyenJO1Pubr31ZUbjndWp9oS4SeHv8I9RZGlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgaiQ5duBfE+JZ7kcvP052UbBhSy3gMtYwnc8YY346Bvk6/tO5eQ6l0VZdnlGw/EjL/m/36N8Vu8JHfdRFHHHD1TrRyCuXv3pc6ADxmCx7xMajiNGaHdOTj2utvfToLfbSfxyibngi1oxwpjJO/IjCtlR7BnmtRIk1RlYMDDj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iA87aj+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEOh95w9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iA87aj+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEOh95w9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD61Qk2329828
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=; b=iA87aj+Z9SmKi8be
	luOzuB6NnY9KfUCiUofqNM0EyXl+NG2Tiej+CVCma3IAxAdFwTpVtRxaQJ0c9JF8
	WAQ6SylQLt2BXfX8Z8/avmXtOPgz4WaquOX3tNzvy5yyQ2uj37DsxZip/6TvoiFx
	MgEW7f8sQkPF235TI+A4kG/Fhm5dYEAtfP0ZpP30Y0PKU3OqHOa/u+yK4rnTJOKc
	4tEIMNeykXFVa4tjCGmaT1E/pcbGoMvLsdvFy2OMSeUyFuSq0IJ2aWExG9JiWZsB
	hkXk+l8FOq85mXyGNHAOzsqK/GT0P4sTB+fiAGJ3KoPnyMQN98T6c0UdlSFBw6Px
	dm4TdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghst88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:24:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso4191421cf.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 06:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973091; x=1787577891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=hEOh95w9lf0EoVxHzC2mJ5Ann0UnMyUO3nLZqNWNCAxIJnrhT0BymhoKGQYC3MAe7+
         TS1NA1LR9p2CUPZ4JK5AVm4Gp0eIhGYTSB2phdKKr2EGCM4SCOxPQdMS9CZ1YCq5jalX
         6zcv8ZyCjDG5pBGfWU2Zz0Ocq4nGy8JlVfk025mrr4sC2YoS81GmogRiqQ+1FbwJREXZ
         NfcD4+0Er3mYcdHUoSxXcxlX8UYue8cZjOf/8QY0DDDURz/+2Qx+9oKKIIhFcf1QdRYB
         ucfFyTIADiTt0dwBcm/Vn8zeAvnnE6ILADC0q6uukTn0y8QrLzjH57IVq+bDInVflFol
         HhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973091; x=1787577891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=bnqaXAqCUtXTz5VCtlvV3xRcZ8xXo+HSepM5B6VPkmZOj5PUHKbRtURPC8qzVDep35
         RSdBeNFQKqab4kdgQYssrNB0LyBlqOkbTSXxvfYPGj1V12hfUXbncSuZ2F8s2Wq0iD/2
         0qFae+i6AyDIf+SpxAgQ37bzmbc2MgLOYJ+cSv4Lhv5o3479b8Fze/Mt94S5ohC0pQM3
         /V6+zgLBxRJdkiRt0TNqMVIeTiHO0egrWkTuNpLp7WzfsERBjfhmngDHK61mcPO1oKdT
         RMOuYTWOpBIsJztbyPpaN7AwF07zLmurvgyZz/8DqgT94uLqnNXAapczNS3fMNHvYCi/
         J/tA==
X-Forwarded-Encrypted: i=1; AHgh+RpjaNPGn+YUYaZSCpH+sgwrpZAngWOBIJK5ce45V8CcqA16kJN8Wdqey0e89K7xwcN1NfSzZR5pBL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ShtUlrGph7Hw1ZbjfQ44iGqcaAR/0g3oRRxE1Fk3Kd7sJ7mf
	lXW185l+4dxjketWNIykcKWiTJM0wmuEvQszZY6/Mr0vL9KRzNybs0SnEs4ddlUqTgI+MH4DWd/
	A2Yq5appgnKrVV1QdkjBPNOpJ21fp00B2+yo0tR74FJtSuxZSUDZQt+Y5KQnqIRc=
X-Gm-Gg: AR+sD13QlGjrW2L3mNS53FHbvm+R+JqTswGq0UFEmn6stMhNfb73PR0fQYujZyA6dpr
	D2ZmaR3R42I0oOLTT0G3dvnIUnqy8tNHZhxPEgavDKhoRrkv2OJG/5ubQpG3gtVXW1zBYT4NosR
	+Ywz6zqWaoi7W6qyXigDIOHWEFpHp+VhCridVxYuBD1yZn2lrm88wHV2qSXBIH7zzndys00NyHV
	kY93vaJ+4PV3l2pO8oCppV6LeJrq55cPg1ar6MGJzEtdIImqA3epflLcoqhP7jPIix5vE8UbIUW
	lg41vTD9sA3/5zuvn+VEznjhvhBwdTze0XaqO8d0Oht2FIwc4awnDaIqzxI2w8HX9MjX0FYqB2l
	kWKu0QE+ecf5UJkcuni4awjAi
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953511cf.1.1786973090888;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953141cf.1.1786973090323;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66a7sm26799466b.59.2026.08.17.06.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:24:49 -0700 (PDT)
Message-ID: <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:24:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a830ba3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX6JalCPFwgSXB
 ELN73umqbd0f+DMVU2wtSX0KsgNElfjzfz0thICdlpQlVUUPbMW1yNzYxNsYfy29WIPfAKrkQGM
 4a1h3GqBE2O5jVZ50pFYfVZAvQYo0Qk=
X-Proofpoint-ORIG-GUID: 05Xe9NgE-dZRl6sd9J-3vLZNBvxkpBW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX+a4TpWV+3QZe
 lN9KbXvLHbM59du4Jxc+DT9yuhGbxvD1w5LDmAQ0Y1aPoh3PZp09RhXC3iXP1hwWoQD4AeVQtPY
 wT1Kd/ficd7WlAD1MqMTj/vu8GiLFtbjRto6O1+6snxtIVkKDr+mOXqfpggZRUN0neQhOYO/Rwc
 GaoH+8gOW7HjjtcAEPgCpwTysSJkyX28F4Sy99NPXBcafNqVTjc6Sg2nb90XoZ9eg96uyLwd5oR
 XVU9lyaZ3TrV5K01ntayZUAn6vdvW7YM+pr0rdpgaGpGGq4YOJqvS052F24GoBxkgJF9K+mpxYv
 1AY/u+PVDDHH+I+CJlpsQH7pzEvPN5OM7/SijaFy/Zz77SMdT2h3C41DV05OhSQUgiZ5GGNKNTM
 jufMpLKtax4BE4K4C1dT3/ExA8LUvUS5Tiau1Bquhjh/A2AlcLnvxMFwx522T7m+acXnSqM5fP3
 /4qYy2WcEV6oAibcJBA==
X-Proofpoint-GUID: 05Xe9NgE-dZRl6sd9J-3vLZNBvxkpBW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	[65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
> +	[66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),

Function3 can't be selected because of repeating names

In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
Perhaps there was a longer name that got truncated?

Konrad
