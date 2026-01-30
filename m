Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ABB354AC7
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769377; cv=none; b=Zm+yOKCeJFhW9CNdHhLdz57XNCyIRCL20x4sBTwXBCzuQDW92QcEP6f4gyuZSsW8hSo4xpRxCCyF+49nUPt45vQ9LtakH+OIJ3AoD3F9HxwHWKBzhDtzlWQEfBCcIqhju/HfgFHE4I/SB1B1UGaUrZahS9jxMbBY9iJZjcO4Axg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769377; c=relaxed/simple;
	bh=hfmrj9P+j01HoA3GJA5njWt63IBxLmC9zENgjTjmTMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iycuVfZzfWmmx2ldJ5r0KxS1OwECbR/oG4apz9t2kF/d2IfOcNyK+c+2xMTRuxCH/4SxlRpKOQA/A6IA9N41AHUmklIubm9Cs3NBUFtFzIgnChn0x3/V/4QRdr6rQwrl383wdnAPjSb/R/GaWJZG4FA/moPLtHhbqFv7nCsq6io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6T0LzFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh0FB66d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6T0LzFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh0FB66d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9UxGt2675371
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 10:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wl5V3XT9hGaQENmvghDS/LfyoUs8wvTCz21wt7ua918=; b=o6T0LzFkZQLf7QDN
	hQ4NQjA5oYIx5jfzJ4K7iXKjuu+sndXC6305/S+9EewrR7NGdEOkw55w7qr3uh7Y
	1/y7naD9fJg60N3D6sqOxd4d9KRyTDY2oiT2zvkBbEaHP3HX23Ecz70feOjA+yYH
	NE/z1NfzHdVc7/9JG4cECh0afNMTubuV3fq3nLXjzjHRdO48aUcngbdAsAC++BHl
	wBncQNRVJ47+lepvJsrsAMLTa7JoWTSocro8lmEEQ5mVIUPKZ0MReK+9eitzqQG8
	nq6MqbVx66QfoVgOjOdZ3dIsHqnEo9+eH4wK3Kujp7ivqPeosKiYZbGxupgnxcfZ
	L1JznA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t34070u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 10:36:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a182d4e1so38153285a.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 02:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769375; x=1770374175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl5V3XT9hGaQENmvghDS/LfyoUs8wvTCz21wt7ua918=;
        b=Dh0FB66dHPO/PajRLnRijUt+MN41AY7VJVR50jPyhqTNW0QHzYns6Px6EMlLWyJswE
         aA6BqYlpBTPw1o/Vj6ZNGoCJaki9bbtdXNraE3ch1BMSUgeL6ccktRo7aGhMnkhf3OJi
         Mo34RzrOzSS38+pyJJBjYsNPm4PQ0ELL0zGjL+CI9vP0qFnpyQPEY4O4+ekTPiwPOaOR
         OZDcDeydbnhidjD6sc6sN5IbvQ27KfyvpD8u9chMYbdCDkuXC5L7xQIcLwiizLfQm17z
         +VkqjIHlPugJMzFeGFvinzDDHNWkccWSTgRnRmqi8fyDbnYyCYSpef4Vc6KDmUhv/Ind
         53CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769375; x=1770374175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl5V3XT9hGaQENmvghDS/LfyoUs8wvTCz21wt7ua918=;
        b=oltHeYZO5DGAU1BoXYQaNeGEmPbN5nb8cxLpqpPxQaEesfAV26iWnOWRrAxrFYohUu
         tHh+wSaDIOBo9A28/QcybM8l8jtxBIL/BPep14AoQQ73wmh+omzxt120HRqbuVVPV4vX
         R2Cas0WD0HZsCYKKWH6Y7RK283Z49jVN9Ni+D44/UiMEaeyBvmaKtJeDQvdTrKxiSMTB
         ElZQJlwp/5M+b8Yo5WuYhdYNtISMSGHnBxIvw63AKIE7V7KFd3WSPyDHuH4rEX6ZyTjU
         xaADPreTtbVPZihvR+CI9EHUEI0ShD1D/g35RA9N583FF+/0uXmKRuB+zejkrRSFbRUP
         /cLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi42s+EKoZFU00OKXzl2AlpRJb8DPfFAT99n4qr2Bi7YoputnkyQVcnmS2ION7MOiveXBgYtwheJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUHPZhSo7F+MPK7EiygP7Nc1LUZ436xz9g/uFcqBInJC4/4O7
	mwzmpY7qnjuEj2KzlVDe4mZvrge40scS+8zevzoXEysUe7lUyFpMW6lmZLy8+e+KqORh2m77po5
	tB2d7W5NT07UwKd97+G+ILK7Gv3m1MsarWkw911e857pn2zUyN/J71w/O4+Q04YI=
X-Gm-Gg: AZuq6aJ1PeETNdNmveHZa9t18n5zGatyE5lDcy4/XJqG9U+bkJajhhNow67tom1jJ9V
	43DvbS9R6VRnML7Cb6Z2CXHAKj1vylxchZm0FWdfB2VMJ1rHedrw6olsHaShz/5KiCyFSvkwYF0
	aXVrihPeivgyNCurCZQrzqPrIpWHQfPClmrQEXZyfRA7SC6NYVsTlv9SDYojGr8X1P8pvMUyxCm
	0O509y4vcVSdYgH7deuob9reeG3B1iihmd+QU9ncyJg2GgQGgyMfgm04Dla1NoxrG5J0mhzAuO+
	Fm2wMy+bKHBw1rzsHS3Os64XHP10DhAILEba3Kkps2x1XoJIlpsgJMVXzPWCNsaV3CsTtuNbrM2
	NYYGq8uEXhvJg5nqK0NP/aG0yJm5aeqvUZOHAC9Y2/jYVWN/eJuKn4LmLrG8OwKtMxMM=
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr271019885a.5.1769769374851;
        Fri, 30 Jan 2026 02:36:14 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr271017185a.5.1769769374372;
        Fri, 30 Jan 2026 02:36:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc69ebsm403930966b.20.2026.01.30.02.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:36:13 -0800 (PST)
Message-ID: <121b00a2-2040-4ac4-9ce4-3865f9fa09e7@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:36:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NSBTYWx0ZWRfXwQX3rr4fJms9
 X77mlvY+Y/rXOQYRXbU0kgPIheMZd858jZybyw5gcEc62x1fP6qGH8VqRJ80EZ/Ds1UomC4N8t+
 jfNVBDXjGVXz1z5JrBypQsvLo9cUNFkL+QIVVmPC/gSvZTtCLQpnsqSvfHPXd0bPEo/irlRaT0s
 Xa8rxyPWWuWGXqx4jyymemUhFZ/eXJBdEiXxKD8XbHIAeOZFcnWqDCaJIeEtTIjzdaXVQfr66bk
 IpZPGFETbr9YPAf3DgtIlc6vWi1UNKhoARJxtCgKJMfNa4CwN+W9i9ffHiRtGj4IX+iWlsIy4cX
 tPbwLywb+2NH7DcPbjlFuN7tLD1raC5JbhfKPYxnfeGv56uC1GyI1asFV/TQ+bbEQscyZQQB4p6
 OchUllvsJ3m4igqGtU0tVz1lJSuuSxrJnmOmIrNq2qIPE/nDs06UF6fq4EW6MBC615odv/m4CDa
 iaWguropapdsb9fwMPA==
X-Proofpoint-ORIG-GUID: HG-PtH9tHJmJk-kmk-fdYSR2vy4aiqms
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697c899f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=67GeUOcPIWvtFfd3FpAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HG-PtH9tHJmJk-kmk-fdYSR2vy4aiqms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300085

On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Krishna Chaitanya Chundru (7):
>       clk: qcom: gcc-sc7280: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sa8775p: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sm8750: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-glymur: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-qcs8300: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-x1e80100: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-kaanapali: Do not turn off PCIe GDSCs during gdsc_disable()
> 
>  drivers/clk/qcom/gcc-glymur.c    | 16 ++++++++--------
>  drivers/clk/qcom/gcc-kaanapali.c |  2 +-
>  drivers/clk/qcom/gcc-qcs8300.c   |  4 ++--
>  drivers/clk/qcom/gcc-sa8775p.c   |  4 ++--
>  drivers/clk/qcom/gcc-sc7280.c    |  2 +-
>  drivers/clk/qcom/gcc-sm8750.c    |  2 +-
>  drivers/clk/qcom/gcc-x1e80100.c  | 16 ++++++++--------
>  7 files changed, 23 insertions(+), 23 deletions(-)

Using a terrible chain of shell commands:

rg "pcie.*_gdsc " -A 8 drivers/clk/qcom | grep OFF | awk '{print $1}' | sort | uniq                                                             

I get a larger list (it may be incomplete):

drivers/clk/qcom/gcc-apq8084.c-
drivers/clk/qcom/gcc-glymur.c-
drivers/clk/qcom/gcc-msm8994.c-
drivers/clk/qcom/gcc-msm8996.c-
drivers/clk/qcom/gcc-msm8998.c-
drivers/clk/qcom/gcc-qcs615.c-
drivers/clk/qcom/gcc-qdu1000.c-
drivers/clk/qcom/gcc-sar2130p.c-
drivers/clk/qcom/gcc-sc7280.c-
drivers/clk/qcom/gcc-sc8180x.c-
drivers/clk/qcom/gcc-sc8280xp.c-
drivers/clk/qcom/gcc-sdm660.c-
drivers/clk/qcom/gcc-sdm845.c-
drivers/clk/qcom/gcc-sdx55.c-
drivers/clk/qcom/gcc-sdx65.c-
drivers/clk/qcom/gcc-sdx75.c-
drivers/clk/qcom/gcc-sm4450.c-
drivers/clk/qcom/gcc-sm7150.c-
drivers/clk/qcom/gcc-sm8150.c-
drivers/clk/qcom/gcc-sm8350.c-
drivers/clk/qcom/gcc-x1e80100.c-

I presume these changes should apply to all of them?

(sidenote: 660 has a PCIe GDSC even though it doesn't have PCIe.. nice)

Konrad
