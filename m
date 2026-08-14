Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D841D104
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693227; cv=none; b=O+YAneBBD12KU2U55zGyIKCgqlhANqDqTAHOj3XJ+BJ51uyRGAYklUO4/cQ4ovaa1GVpCilrdU5c9g94nyEk5eTiSa3I2mOSRkxKmF2EY7R8pbH285dozzaexHHf4U2y9rwNysTDq8Ao4v8yGWZBoxShujyhTlp1j2ZSSHnDR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693227; c=relaxed/simple;
	bh=nH7Q+YQSIAoDWSgqsEWKxhw3QmJgbzhpW2lFA09Gi6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ih3wc12UmdUvBC0i9xdVUC+H6B5QktOw6cRBLII6SGNfAMFZt91AO6rX7B5rcTZCEAfZ35xUrKN3i8u+IwAU/qy5O3IBozRHe38u7m8ApO1CkRXKRvUgE+pdGrphrWwJhpZ/r1ZJXFiiqoSAQ/vMnbcXsYW+iHhvHqd3C5Kv5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGZAaeSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWetiXrp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGZAaeSX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWetiXrp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QtSQ3615498
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hH6IKL9fwc0s1y5p10ke9/jOey7Po7DQwNE9DthmsPA=; b=kGZAaeSX8C8u/uFM
	L9TOEGXxq77bUZyqea/qMvM01/CHZ8R6P9s/0mDOwC49W5vnfnU68LF6O4xGqlN8
	JN8DplqM2RtC4qKo7VMBu6wdMKKqtH4c9KOuegFw0C9YXdhhDO2hSV9+AowUiT7P
	VOv3M239qLqEHWwmmm2B4T82pVZx0A1+zAVt0ifvj6EeBX5Zr9Wlej2eYY2xQdxs
	qvPQdokD7aYosdX/vGt2RT6y1M5oGH17C7z4XxkUvvAf7hF7p0AiCBpMOeIYCbU7
	MGlpCvHtyRRfNwgtLNk6AR0KFeScR3o0nt9ZQSOwOYwCJQM1jNy65P5ORa8vuS9X
	g9uk1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy33nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:40:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487eb67173so1074069b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693217; x=1787298017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hH6IKL9fwc0s1y5p10ke9/jOey7Po7DQwNE9DthmsPA=;
        b=VWetiXrpBVTUrQDqm06kbgOEHGTNxPQvmxlC7G5yGoSKPaOFAj+p2nwV4EDT//E8PY
         qXlQBOMRMt4iVsUxKlJb0B63QA9bsUaNkeXiYb6dj3YdCi2cJupIxc38xOGvN6Hg2DdZ
         KcJrpuMZW2jClliudbssALiXECXB35RTC/kOJdN28vh/di/0WuNC3US9kolAzS2YkfpN
         6nhONo/duYrL5lmTWaKcFR0ysTiJMjTWda+7Mcw709RGRqx+kzQx1cDP1qEmmMM7NNjJ
         TkM/aUAUy13TV/ArYC5X8LfSEsiiXBMtx2wLespMkJtg/dIA1mKDiekEB5OKhhixi3W2
         ai8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693217; x=1787298017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hH6IKL9fwc0s1y5p10ke9/jOey7Po7DQwNE9DthmsPA=;
        b=g0+g0Ya4jqbH3QJCA5UT4umyMmlNRNqv+ifTh4O0dl5POWDaNR4SgQw9R/stzLeFdQ
         w+19Ke5JWFIHTx9CByDEccwA/zkOGE1YYyyz2QEBO0vYeFay7Mr/uUuhDQ3oeuCrgmZM
         +LfhAnoGKCxTn4UvSuLrDYLygWglqfdqNmYDY2d/PknFjycd8uxJzQyzw/zsSrhuxJ3i
         eHtZxgoCOZYzS2n7a2iKylnQUK341v74emTj2wgL2qcwxAU+JsgQ0BUHhbUExDLwKhYK
         6JU7SOn8pTudoB43OEBTqhBLRhk5MxzbxKhP4hQCgEVwS7V5004MRuKs0f9SpJz85mKM
         0Agw==
X-Forwarded-Encrypted: i=1; AHgh+Rr68lD7fdLpuwnGryi7a1ZVqaUI5NztRQ8z7o4iLNB7V/w7jgjLOWaXJ2Tgqt8agmYEKJd0XQi7ZIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyS6s/s0etINVtMtGJD0qVreKkVKYGx/Fde6XJeAcgmp2V07OL
	5sVn/ockzU/HjPwndiS9Iy5pxNfzD7n/ZjR3L5DkMkUj5YBh7kyeJvitx6N/KHr0+Gb4HB+XY/d
	5k4qRO/B97fhLevA3TeTl/UI9xjcpYS0STxLEKO9H37ywfOFH1ShbHntJ5wA1HQU=
X-Gm-Gg: AR+sD134HYfVXzYIqh2jfoZyThmsI6eDhxJmCHNwqcvfIBlXlryQqlHozFEPvvfEXKw
	6pupYf1UWQhHBkzInU9RgOVAm5FVvMe+TP7uD/a5iEIlw20oVdagZfmmJU1SrD68VetKzBecDEG
	R9/3p/T/skvSm88dhr7PhocvYqVJV2UgxvgoPShsRS4yNRjMceioYK8s5dAJrN9V8mEpL94TBMV
	X+of5U8FtX5qp6widIPM10Ib1+sEj85/7qm5hlKUCPy0FM1j3cBm0Wz3hRRYyUBSYtw5Wer4mU/
	PNsDJLav8eK+O6KsjfoSNPGB3i4mpmtthOUDv6l6Vgr+iXy9BQ4ZM68qx/Krs3liEx9ZzWqAxfm
	593uooq3szKkKzd/mk8DSwycdT6YPENHbjG58K9OP14bHdcjHMNFhPgzU/D7cN8bBaoWRbU3CHM
	M5QeqqymDCfX76um8z/jI=
X-Received: by 2002:a05:6a00:2e90:b0:848:19f4:3b52 with SMTP id d2e1a72fcca58-84fde3d4d19mr4081123b3a.38.1786693217265;
        Fri, 14 Aug 2026 00:40:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e90:b0:848:19f4:3b52 with SMTP id d2e1a72fcca58-84fde3d4d19mr4081081b3a.38.1786693216789;
        Fri, 14 Aug 2026 00:40:16 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc08f386bfesm153763a12.3.2026.08.14.00.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:40:16 -0700 (PDT)
Message-ID: <500fc16d-b4cc-4c07-9d0e-f2a4e734cdc7@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:10:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh power
 domains
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <20260809-kuno-soc-support-v1-2-5e0ede4a0c72@oss.qualcomm.com>
 <20260813-gainful-festive-goshawk-1be511@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260813-gainful-festive-goshawk-1be511@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX3jFkOgWJb6PW
 Z1lK0qN+1wiZ6bzlGocEPsJL1kFEFDbeHH2FfqPXUKi/QgdcQqF5gvN7Wq2FKsTYOrNAy6VvjIo
 WBVm29l+6gE+sXJC0mpLOORnSlPOHppNZ2fb55zJcAhjJCpVWxalnu8unTCZHqumJ8aMvbUWFAn
 5yJM2tLgGe/NT5ix/vhC22wbx3xGLGi+0TuF02JEwwkaeqrkJZa2CvdcHoK0sHvKMUtunFpw1p2
 0u3vwwl+/1GpWMjDdcalFXnLlC3JVWJrsbeIOLAFCy+VnwlV2By3B8VLWEaJ77RR3RY2oHSaj8i
 OT0FaPSn3DsldmVTWmZWA7e6FFr2pEH4a/XeussmhdzXqafLRAEZJN7flmwvnoV/hQ8M9sGCZqV
 qyIHOcXxqu/ZvXfBBm+Ro57ZsOS6hWmgtk40kXtjC2+ZPu05h5vGNEzQZ54qzfSmchYen1bSX5D
 CoYMPzgl3VZcH0m10Qw==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7ec662 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cQuL5MwCX6JIoe3bmXkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 3bMJsLKYhSIFRo6zQ63W08zz0JzTSOrl
X-Proofpoint-GUID: 3bMJsLKYhSIFRo6zQ63W08zz0JzTSOrl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXxKGjc7GIDoPr
 UN0wDyAxkE6Vn6NqlQSQGHR4xb8B1jeHQC7fFiB0Gw32bTHZKuH6IqokC593g++Xu3ZDv75uJ/L
 wmNMqqCxJg8uib3o4sgSr8y3b6dAi2I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/13/2026 3:05 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:57:01PM +0530, Hardeep Sharma wrote:
>> Document the qcom,kuno-rpmhpd compatible to enable DT validation for
>> the Kuno SoC. The corresponding driver support is added in a subsequent
> "DT validation" is irrelevant.
>
>> patch in this series.
> As well driver is. Look at other commits how this is written.
>
> Best regards,
> Krzysztof

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

