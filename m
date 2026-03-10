Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0340F38946E
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143075; cv=none; b=n/8NybTC951OXdgoPkq0bt4aCrOXohPGFXYdmWAGAhdCM1tva74n80A1JQ6BwfxPQ2nwH2LChz6C+SU8YoZOn4Jmne7GvyZ3TSil/ZoC4WX+Fdy7Eg0xPOjUk1QDXnyeZrpSlNY35bdfbbL6GIfv7D1XQzdVwIMv1JYU183c4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143075; c=relaxed/simple;
	bh=lBw5t27jHEg1Vj3u9vFmZOsS1L5o75PiXJs5ZFvWFIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPw/u/STbWZ66tRVTnVlZ1jDLlEy8zC+p6PUe14DDUItdyFWeORbH+thkeCa7LOr2i6qUlqbBSObl7/UQemI6CAFFDfwziWPAr5IFJMpbSq8Hl0Ux1wCLz+Swhj8IMs54Q7ybb3FHlk8P7xbk+gKgS1cSDvrTZ8bpVPv+isbwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1MC0u+o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifLTo50L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1MC0u+o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifLTo50L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h0pL2753873
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXvuII2zuA9ukukH9wM2MdKQZwHESE67XMzLBT1P2cQ=; b=f1MC0u+oZU7md0vv
	QjClhn8rb/OICh1zSZmQ3Vqco7tu1agGFRifJ5vvojmihN8Vz5KlOeQ4tEhebXEz
	dtwLKpOBIXy+wsdycbl33jkLdvSBrzMESMAsc/WtdWEtUi8mP2VHTeNmmE9O7Wt6
	ALB7dStC+zhz7DgwvoiJJlKCJArjVlbo0akDs8ZgwTcLP3yVhSz72KBO9HXLCem3
	bxjrSUMG3JA7FE4rCx87CGm9RsX1s5gdJSmV9SxT3Z+V/7cZw9qzl+ti8wgSq50M
	7WgiMljgE+QEK6RNMwJ/DVeUrR6MVcZ7eag2Tm4nv15q/7wh3gPAmFx+Uwm7Xmrn
	cFpibQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrppc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:44:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7a2c535eso34443685a.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 04:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773143072; x=1773747872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXvuII2zuA9ukukH9wM2MdKQZwHESE67XMzLBT1P2cQ=;
        b=ifLTo50LgLo9WeNHRcc0sTshM0+niz6LKqrgUB3FzC/pew7jT8D0SSv68MeBg/efuX
         GuyiB13nx2U4Ss3d2nVeSByCUdhuXNjt1B96RIyd0naBbrvHjAzBsAOd2eo7ybP+mRE8
         fSwQqVXiKnD4yzbV+R1lmxj6JhlR+Cpj80vx/Dh/o0W/5cFa05HXNHH+YB3Dm/Kxp5vv
         K/YcKEIl52RgqqhtYw6zQ5rMINO9b2+5oKjuaG0RriUkvGZHICRZo6RQeLcyIYlhwjQ6
         u8K5JA/Jmxwv4m/Kav9VV/eTXe/OZFu2bbOUhDiuxdOdqtXIReqPNAelJBsMyIBlLUtH
         2KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143072; x=1773747872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXvuII2zuA9ukukH9wM2MdKQZwHESE67XMzLBT1P2cQ=;
        b=bvEBKreOUHAPzgfh3XsMaR+SJalbgQ3FKm+zAH891XSvf1sgnv5rnV31pTVuYYz2VI
         mDaqcY1IcA466A8ltd/9rDRRt+oTT1xQ0+CBl+ibxWTRl5d4yTdBZgtUtFHCYhsoR214
         1+TWre/eTubxFuCzQaUbx+pZbVtA3iIaVzv4g1Ix1mQr7PRITQnf0vh846z43CyldXRL
         DybnF2jCuWUlSypOHlkBbUvcHj5opyULNYqiLYM82f/XC5jivpNzOnwiiNhionpL7HKY
         3X3PGStaWU7fEjoAXY4UvWaPpqpaq4tyC2AFqNoun+dTpvYtbuVcGYWSwVywh4yCSL58
         rBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF3Yf1RqtAIPtzAUvgDBxShLhAisSQ/jBZLsGmspXJWmJIpRDyXYoeyws7OIKrrydW4Vw2nflZsOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfW7viMNZzP3Ii1z0C9iRKcG/I1iiIswsiYroJgs3O/6QX7BSg
	/a/evJQ9RRpdG/OYGHay6OWUyyyUS6kS5dh4S5vbhwlGvIjsykkNQRirpFNNz1zZOjdeZD9rAvU
	txpXOd3yYutDola/cPUgk5X/lsfPvaKp6zA93LHzXG9op2Kdlan/UG40a4H+JrT0=
X-Gm-Gg: ATEYQzxeYmZAgrnM80ZN9KsHnVQVryDnuY1G5iEgyMKJrdGXAVjp+2Zjj0k77gD/18U
	YtoNiBvsRQucKtY/DLbpNrRZaOaGSVJCz+ZOv2kzhWu6x+d/GY1FACAWw8T/WQYh1mpRiheKwti
	Ka70CGy6TuvZD5lEd3lWu6OuMBdZxjs7TibPz+NiwJTl038WkiAi8IZRA7xP/4IrzCaQ5tTr+/j
	ymCRdGClXT9q0L4SSZt4sWG2VC6r6jJ6ArIpbhrNOqTjMxZG8xbg7tnz3zNa/s2JR1CYobmgVQo
	+27hvBOMlXz6rXoia9JpuO+0ZBIy8BDzc5wQghV6jq96JBrr5NsE1JidB+wrO0CXtBgNN6bGCGu
	+gD9+LBwZO8p6QgeukUkLc8Q2o/5h+Gj43Y6XUSqm9VK4+6YQqfxH9/5SauuCb9RhNSyhAQ0bli
	zwm+Y=
X-Received: by 2002:a05:620a:7016:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cd6d4444f8mr1349743085a.6.1773143072376;
        Tue, 10 Mar 2026 04:44:32 -0700 (PDT)
X-Received: by 2002:a05:620a:7016:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cd6d4444f8mr1349740485a.6.1773143071854;
        Tue, 10 Mar 2026 04:44:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b116sm474033866b.23.2026.03.10.04.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:44:30 -0700 (PDT)
Message-ID: <8eed4bbb-6d3e-4ab0-a6ae-7ab2d62d3264@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:44:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] clk: qcom: gcc-sc8180x: Add missing GDSCs
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-3-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b00421 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1SaQbFAW26ibWaWi50sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: q46l66R_jKGrypbz1htSQoclCmt0okDy
X-Proofpoint-GUID: q46l66R_jKGrypbz1htSQoclCmt0okDy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMSBTYWx0ZWRfX5y6vwEctzwOe
 tDUs4i7+7O8W6pnniUIvdo2hWG8d8/88fn8IPfj6CMqqtVByweNmoiMcnMi4Rj0QhL9mZbiI5XC
 SktzHDLZz+OmhPFIF/GyLtc3/sDCkoLhQ2P3YKPmEa1COs3dVxRJYll7PXHlcWHOKQqKAt+aXo2
 +vyaS4dSNqsAUxg7PCZHHe6vRpkt+v/6u9sXkawD9//WsYcaNE6WQmrIk0jgH9H5SXjksNHTb2i
 dl7xh4l0YdVbY5Jf3AkK2u2KIA++f+E72wwvT458sGdySo6sR8BvZdRLDInTE9A/l7+VRjrIltc
 OSyQuG82oZy4svGQ2qDO2n+gIziR8e+Q5B8e47Io/OJ7vhux0cwuiPil8xrbsMC939awfnLhSSY
 cSQKbeUulI9H/0VEctcKkLldU1KI0ZoUjXfC+KK8GAtfw5Uc86Ia9mnrW29aDRVwT194SSIcoTv
 RMW6IOyFZwjMbV4j40Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100101

On 3/9/26 2:00 AM, Val Packett wrote:
> There are 5 more GDSCs that we were ignoring and not putting to sleep,
> which are listed in downstream DTS. Add them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
