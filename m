Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08503E51D4
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068509; cv=none; b=oGTHg5HcGQGOuOqXAFUXjj5l9y0cxmOJc1EGIIfBl+B7UY6kKU+EPwWFtsRnli82RaqoJvfvUwVfo222exdLHnTHzy+4AtnaD0ru/VPlEYBtC5VCvxST9LMGZKJHIH3tN8sZ7PpUZT6hYUhGaMJuElnG11RNpgU7D0/VEwVPrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068509; c=relaxed/simple;
	bh=8aE5deZqZPFwMCXvNfgGk0kvRqPcCOhyMdfVtngPmno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvrnvgKqPSjVOYLdDmTEE+IXsIfh7O/+hlbmV4gTqfSIMLYWhqBtpioeMgU1jA2zuiUom2z3DXT1PTvCjFlH27gb4wCqfKaBNKKtX7IqkUo7FQKO06S/N19CRJJHVhw5Ih3eX/QwLFTbWyFPyMvuBsMinG3OWmNVwI7OQb0LYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkWEtPfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCmaEslT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkWEtPfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCmaEslT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dLH13704534
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 09:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=; b=jkWEtPfd+a9OyVHJ
	4UDX5+PU5SxeXgJ/2Ny027y/HSSbKye5ovB2dHpO12sr/FT2XekHd0JvrZQ0hDE4
	68qmRoGYZSOyosM9/C0r1Cp52AQHYI8VR6toLE4i/1Zb2ewTlvg+WVU8ltsyPV1U
	+C6K7IIYC2o36DFf0vyiyrqUDtM0X+0iZrKKwF2CuSN2JGm40CmZPt8WBBDl03Dv
	AJOvJADQWwdWMKq2mmaXXw2n7OWTJbU2HZYUslqgjjurXpR1BClHfPZ+H1dhFRXt
	VaioNrbfrZC1GlEXXLCR+x2g+WGD6qvfcPBFQn2FeGBYA2vS3jI+y49OTRsx/KTa
	Wfn9eQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqg526-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 09:15:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfab40895so48526485a.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790068506; x=1790673306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=;
        b=KCmaEslT7XCzW5RsJNbhhZ3gc/QQf1YzqQiJsyJHgYx3AuFuPw+b2IE0j9cbyxQYi4
         iTrLQnzQaO1URjc5X1JwF/J3lfZ8EjxMoOH0po6ggYIPrfmR4pPRboYd/ZbDAlR3JBt8
         L3rbXG+6aV7cNAbP4osuHdwhzu3t+AxNA/lXi+gOlHzzXh12twl1KQOF97oyvE0BxEvy
         FqyG/bF8vw+kRaQ7bBK9S6Zdy6QPaMMLN5kzxSSvFx/xQk3a/bKKEPppSue5JaIfni+a
         ISrffgSrlQZgjF6NlDhjYmxoNMad/z+P5XZILS4AZafcRCyzqpYs+Lijej+baHttP8Px
         zJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068506; x=1790673306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boZ2wUx2qS+wC7WZW0j2K1vODt8kLDmSC2O7SQmUuIg=;
        b=NFIOcomEtMyFxOeOkmC3AhfPmBQ0KHSpfHFgVjVjzl/Bb7Rkg13JS5SLcttt0n0jyZ
         8Ysk5Pb918PAzXcAkGn/POCJLdTaFiZ02xG53JsEbM8pmd89igtAZJt+dDugeeg4pcOw
         QtQJ/JtCZt2CbBTM9yF8x7aIiICzU5mWb/8d1u6ELDA55zyc7Enefuhv5XP9C9jcvFLY
         aO07vxmlswyfVK5nvlRoRkIHWo4Oo12+1gSc0SEcT5Qolu4QDJFDLtjQ5mnB3b6MbInE
         fnUayFChYPCbjod2ous5PQdjTj5Qf/tMytYpbBuU4Qilmkx7B+RRfQM/bBHvQKyFsLLe
         JIcg==
X-Forwarded-Encrypted: i=1; AKwUvBydGqUw6hGl78Yt/qZE/zYmCtxTMftHXegRoHmM5k/y+onEw4pbvDwM/gTaaTWNlJ02V6fElSepjNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++naxYf0GBRh4izGCr5YkUtHTvlrsV6glzvlLq0qbcrySU+vCfIv
	+JSj6Uja3byQ6Qo0MOMz2BSuXoOlYRwmNG1l7fDRLF64EFMEzWr8Z/NFxw5BrPNnnZwfWpLNPRb
	iKz7XEH/4hnzur3xkiybQh6H6aQ4mJFY0hwv4a4nZOkadq+RZoBwgyd+AePQKzDE=
X-Gm-Gg: AYBFou3G8OKwT/cIkrq08g+Xs3C1FA9RWsZBM2rA1UfcLQh6uVzrrUiGy12c+S3LI5D
	W0zB81s7lKWygsgKzXms4Hy2VTTb74gQ2Wr8wm+AJAfa8IMfWOci2FB4pz9HwHK3TL9NKyaM4s0
	ZhdB4H0NBFVslD5T9RidoLWXZ4IddnT0qixaHoI93UxNcxzVhMeOcLjqnHEsm1oqjnpzlXjafQw
	UUaLnSLueEr8QHDZ3uHilOZSP4kYMx1O/gK/w6txH47C/h7LgvVPe8goaHbcknlVUOads93doRO
	8/yN+BN0g1Fr7M1ZZNjUeS9Ix9yNyjmLOw3HNjymoCzuFY5jOallh5NM2Yz2SfD7cbmiusQtaYP
	2UKXQqOO4kwKcMmaQq4V6lg==
X-Received: by 2002:a05:620a:45a2:b0:939:b8da:1242 with SMTP id af79cd13be357-93c15ba3243mr481850685a.0.1790068505814;
        Tue, 22 Sep 2026 02:15:05 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:939:b8da:1242 with SMTP id af79cd13be357-93c15ba3243mr481845085a.0.1790068505388;
        Tue, 22 Sep 2026 02:15:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5b0c6csm51663066b.31.2026.09.22.02.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:15:04 -0700 (PDT)
Message-ID: <eefde985-c807-4905-a33f-616a1898ad72@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfXyEe6+yHuZqN0
 nCXjnLE8x3tk2qYWbOjX4CXuedeRuk5U10HEv0SVqmUBJe0nEkSUdt9m6jkdtrG/zfnYiXg7OPz
 vng5Ui/RtYk+5yRgGQOfIc3KYy4/z99fz2CM8mELvsXkvQnDaqb8zfJsBtCrwq7ng2AdmugyuzF
 zlxmc7aALX7EALBbst7WlKwTUI2Q/yNCh1Kz03/ZGo3Y4N9d40NGiyTDDdC8QjvjFEblnw89Got
 u0lJOnY+sCZnjDysBHa9x3qRwzjEItoTqroNuQ6bhlbJOn03h3mJV8GX712sWaYrgqLBF9ooeSp
 ZvxOOmz/SGp5MWe3dBgBy2y46Q/KF/NC6PGPXR8fvVsRSzZZTtswdGeP/HoAqaLOfHTGctyyYis
 veXbCU7lnWHwAvXj3JOBBKnQPNBLbvXk64uvNBV7lnsITYABblIvS39S9TcWTpRuIUui4gG1VRd
 F8eJki/tvkYQji/RRaQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2471a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=SmOWCKbkXSXCNfC1NdcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fjxEnQopn_IDE9OlEkw8y3ncu1h7o9oK
X-Proofpoint-GUID: fjxEnQopn_IDE9OlEkw8y3ncu1h7o9oK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfXxSNvFSLeR+M7
 H/Klo0/W7uSsohIK8qCAhXeRoYyoWiNbOLA4l/fvJPn/t7lGkQeQ4ulnlqKCvEd84dGLNAfXdEy
 Oz9Ww9FbXEjjxI8e6cXyQ1Z94NvMpxg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220133

On 9/18/26 3:56 PM, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

This and the following patch conflict upon applying after:

aedd77ea8168 ("media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code")

Konrad
