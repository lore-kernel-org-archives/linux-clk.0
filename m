Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A12701C4
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048462; cv=none; b=sAsc8kmnr9DqQhR38DAZAI0jSrTasPsM0sFsunzAIdrUyXxaceNYbV1A1UEhlJJEaOluC+b0lEH016YN1pYjGc663bfrSbnIs5556wiCA0ctSoNB8ea1a9V6O8R+g8ad3zQRPzvPEkcdv2z6vy8bEDmF1I4gaNYia1TK5fVWLW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048462; c=relaxed/simple;
	bh=lm6Is8OqE/SGUt7pxfzgTsyif4RJ5sdb5fi3qSnD4jo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tul5ewFQRu/WRbEAtooe6cLObEYoHaJLzN8ohb7Xow6WYTJDRNrhI6GNYkZatPZJmiF1EcG3vEqNLZAqcK6Ck3ne7Q8HakDj8GUsVUST+TYXCT26ytXYlQj8cfuGQp4k4O6asAhkxdZ4wd3OkEO7zqbD6hsh3Mbd3JrkVp12c4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzeW/c41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5smdw9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzeW/c41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5smdw9b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LD4QhX2480368
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=; b=hzeW/c41gJaiJ7b0
	qmEjXbp846iE67uvh38R+fxsb18aTlyhW1NG3fePe0tRqpFYJnjZg6cmSGdx97e2
	J0nUyjyhAnUT+lT9dYhnSrGl/smY6D+K82+IwDrm9B/48ZhosWUPbTJs4QK/9gUy
	wRUzgKVbMRg0grGBLzque1S2XOcXxQ3LQEonEEL72cnTAXX/YfU930QPzIG3y6IW
	rBAE6nDiILV5q/kkrvSU9+RjUgCzrdgL9pnN5BR93U3eCqHpAwyxUVzqz9EmicXH
	fzMWasa1Xo+Unt5bt8r2x7cZf8lho4emIN1QZb+ndtML/hTHonmbr9pjxx1YWvD7
	RNTQpA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5k87s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:27:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so2072134a12.0
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048459; x=1782653259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=;
        b=J5smdw9b0oQOZ8LI5faPpm4DyKaMrntUvKXikbgrFA9ztu5f8jkWiHK13pFO0nLJ6m
         dCLu7d+WNRtyAdUMtcUwAAVXTxn2sjArv39YCfyQAGAk2AbAtGFwU2Ckh3GmUeH/Kufh
         VT5Q+WWhpyOftsNZ3sYk+VyiY3N8tCfa/vIsgYfXxY7XwhxRdaavPOqTRnIeyp8I5+tP
         i0b4pWtZ+lfg6zfaNSIFiJvf5e06BU/1qyNW0AKUMJdVOoY+aPeKmXhMns8QxHBsbCIs
         9nYh04uOUFOkllO76Zn+ixD4gwwpTNs459NYZN/HTOixjHDifRAfi9mCuIOx+V5QERiy
         d1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048459; x=1782653259;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=;
        b=ZIGZsmsADpTZgGTOttbcPQhDBfdT3QPs5by+C3sME8W/cVNchSACsuQxNcBn7MATBg
         RVmG9105SJ6ISgnsiiWFF7Cgv+7pCw5B09RZ7HjbKbReJhMl9kM7Q8J4GJYjsqbmy8N3
         11dXpBIQ+y0yKDOG9TFdYuofFf+cwBCYBHP6q5yrOCUkckXZjkIRBw7aJ4Ru15XZTsqn
         S0X8lCh4E7yHxwkK7hD+//cIhT8EzBh/VLW7MaByiucH6TjyWYU1fy7Sr9alkGJnXCL9
         ToiMvm8jbv0kmiicUZ9HNjMKHKrDv/A57jSFQFXFuFopT11pAUX8VbyKjZBDNnKugRQQ
         2vMw==
X-Forwarded-Encrypted: i=1; AFNElJ95Gvc80AWQSy8McClr3YCwhfHAIX1i9oty7jFBEfe4/bhVIvjrS4FHJI/Vcz/t07uzB5tU12ZkA/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxL+URz0bd2USqdyosIRfmrAozaUWbqAXtH2qaVCKu6g3XJqyN
	a/d86apKJAIuFlK8p6KeoQHLApr7YgFjgWbSCilqhY59XxqfgZfCkY4PqpAHOCXp6grg+6k4LrH
	rJGkwRC6HlkzT71oz8plxMe17zr1broW4FVpxlyK5Dd2WMsNxkNa0vfrIAkw4FsE=
X-Gm-Gg: AfdE7ckkXamXttQvACNIurnUdaRvaO1vfvPlyCA98RvFPCyRUj00kk6U2UOtutOjf/D
	9z+GX1vHa2/SUbXfyqDlIWMJxEwGcHGQLkKe81hdh9AqRBLpKAWiPq3nvhcMXekjx4XdylUB1ub
	Zsl9xIMuVpIRCTKtr0k0yefGogs9qn3/rpc1x6Vs+oK0KeRFbRvcDGgwSKXSWtIY9UHIogp7jmP
	MI1iEM7tK/CpMW8HTBCgnKsOykGjZ2CmTW/7jtpNKfJTg4VlI0UbYApzq6uzwuVIsgl4QOqWxyp
	G2DLLoGPVymINmXS07996IL4HkufT8X+uptapjLGliMO6iS6YQSc63Dhivi11LB8YLrJPz35FVE
	lz2+kCzJvdPTYxwv0UDcsQ8AjpJnQpyiXJ7oEezzF
X-Received: by 2002:a05:6a00:846:b0:842:688f:307f with SMTP id d2e1a72fcca58-8455087800cmr11650751b3a.28.1782048459408;
        Sun, 21 Jun 2026 06:27:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:846:b0:842:688f:307f with SMTP id d2e1a72fcca58-8455087800cmr11650713b3a.28.1782048458971;
        Sun, 21 Jun 2026 06:27:38 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c25fsm5121415b3a.4.2026.06.21.06.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:27:38 -0700 (PDT)
Message-ID: <a38443b7-c7c8-4eaf-920b-9b0563703969@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:57:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 GPU clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>
 <20260605-camouflaged-seagull-of-chaos-afeaf5@quoll>
Content-Language: en-US
In-Reply-To: <20260605-camouflaged-seagull-of-chaos-afeaf5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX0dyZV/j4tic/
 JOVsqAOVr/yo0DUvy9F2aHkdUb6zQy5t4kZdyiwlgWKGHRKI/jwVPyYunZZqpBQgH/vUoogkv5U
 QIr7mDbjrMY7+PtzpYhG10e/RVkQ2Wtd3XFIJHjLuehOdhzuJdUvslKyb+wvrgRpM9uQr1t709Z
 6m7IOeH8PjUuWgbJj5DUfxKCuHNcsrob76GtTGzInIJ2i0Lz8A/sKjk4ptOAdMgjC8YphQFI7RO
 VyAlg2iQ5z1CuR9JPs5UVJVkGlAEUlRnBjcoXmApy+J46RVB15A5cIDiyDxcG4eMJoSq/o6HcTX
 tPa2yiY1Z2Q4HL3vkXW2O+ZYj30gwU8iS+vo2sbQEygvX7rDlKeldzX2FX4joBGBxBvl7GYxTdW
 ZlugZuSvYOPk8P9KlHc5BkpDEY1ycIIp8RR4+GPtWsxYC3jt+NlOVQpenH3OEnT/FNVyb6oiRjR
 UpogT+BOtbIGtiAI5Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfXzVAlZ0v+z/vd
 AYYbr7iT8/jKRriEWQiIs+DaKlzYTTC9WzAOfN6yTF2djNDZW1rYiOP/ab1B+L5ZIYVMBHbRJ+V
 ded0MoFs2ISpoeewV36EVzJm8ojQprY=
X-Proofpoint-ORIG-GUID: QruYmt6aLB42hVAu2b0E0XdGp85olsIp
X-Proofpoint-GUID: QruYmt6aLB42hVAu2b0E0XdGp85olsIp
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a37e6cc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=IDlySeeo0UQRlzYkq3IA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210136



On 05-06-2026 03:54 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:10AM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
>> hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
> 
> No header file? Are you going to reuse the QCM one, so basically you
> have the same clocks?
> 

Yes, Shikra GPUCC has the same clocks as QCM2290 GPUCC, and re-suing the 
QCM2290 header file. I will update these details in the commit text in 
next series.

Thanks,
Imran
