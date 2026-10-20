Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485226;
	b=0hfObuM0pnjMz4IKiKupgCaWdMbbc7Mwpb6xlmNQ32bcOzOiwbuXS595FEtbVLr5/YK0
	 0HX6oMnNheThJLGWtKkjofZiLJflCbF4anGEuBE2FzQB4KFGfYZUr+pyEKig30AnO/3p9
	 F20QLTAdCwc2rOKlb5nIIPkI5W4urNuDMhaHnNJRYjEMlE1dui5KIQfmQjXzw2teX+q/m
	 5We4yYFWbx9AilEvL8RnkO/zaGc+nzaYo8pi1PIdVFvKgz5kuD56eoLo8L78768aUei5u
	 Njrol/amQZzb6TbQ6kE5T3+5YUsi4oQv1l89MPPpv3y5583ALeEZrurGjBLTkhnl3qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
	b=iAXHWBFmL6pm1bN+xX1eX5K1QtX+s1/3o4UnqmWwxWP5AwYrpSXxQGYDs434jWFc7tXA
	 DqBtq6JKPHvjmVKv89RDxp9Sh/MSSVDCyUAgPFh5W6mYEF3t5Ohf25hI4+tT1REijuW3J
	 VsyO4SF9aBAb45ug0jUZKpA83eMG+9ouNYJXGbrnqJq2UTYnk84NgNHlIDk9zYaIyWsNK
	 6s4tqTI3zGlQNHpxSeDtpGfNRk49ONXR413HHH9BIgZ5YZYI8p6aOxrfdJuwJIkzIWAsz
	 LFSQqpB4dJFSxTehYCG1PHdhuOaMMXS+Lk10gOiz5OAg8in3zJRR+qJ7ChuKG3Un/NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vf5/NbzF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56817606A31B
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56817606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vf5/NbzF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8PNKx3306628
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=; b=Vf5/NbzFckgIDw9m
	VsqvR3HDMlTjgkw7l0VUPY9u4e5S13jBuNjqRxzdCzhAtqSC9gKLyhfGqx633Yur
	BS9opZcTtSpFIHiw7Dn2mcALKsdmfc4MXGqYNpio+zTi5v3dicw5UvE2Un2SlQtP
	gSgsItsKlqACFEPDFt5m5j898YxsY5jOWqkWYyKD9jMC08AvLiLXbLqAM/dkLXj7
	+vx1twhvhv28KrB/Yzbu1Ly29bB2Dud2PWUDx/qa3J9sUzcoli1yo3KQCt8lRcAg
	1K2AjWLG/mariazX6pOvjA9nh5IqnT3sr0KrveXsU/3vw14MXxEPut5DRciObH6m
	bif9Rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5sskw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:33:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so98587985a.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485225; x=1793090025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=SMIXbAdLQScYaVkg5e34wX7g4KRK4iDjnBcbbYWc1ZKO4iHM2Qw2v9YQ0mXPcCdEgT
         PpMpyaB79k9RYSxrBN8rYTWqJ4p9W2pgGffRH8ipGp3G6uY3omdeMgx8wQMHN/vhHoJz
         cKrZIGeEckfPZaA+FWvdydLQRNJSpfT/0W+W94hGtQvMWRH5sY2X+MeKw9LhNca44RXI
         aW9ZJ2jLzZnVW2sUceUXu04TkRPMEK3/CyaC3vjNPexNx4sbuotRzPSczlGB1lxtxFNw
         Yu2EPZdSREWSOwZpqBmFhw171sVEncivWQpcbz4/8eIG4AKzQ5JO31RsSt1mOqtuFDkn
         NeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485225; x=1793090025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=fwUzlwGJ3LMVaLo/OnjsXAH8Ty5RRaoYEdyThu63d5akauxhurY8Mb8P0l0JD2G6PJ
         0Rp1OlB12V7OYx1MbvbjKybFmQmz2a3GIxNaG4bPHeibw0LOTgFWj4uIPez0lCaChVR8
         One4akmBcderi+Oe6hlLKBYa9ZdMB7Ncavv4fnVaABLZowLGqbYVrpn7AAlSpYz0/7+l
         go0D0HM/UJJsaIO2IbGvNA+wOqO7lDccYHx0w4IUeT2mBeu5ZBm3OcICUd92gy9fajSw
         HrPLOoqwWd2VY3kSP8nD6agZbItld12dLGJ9I9yGuT91J7xY9fcXXGTWQ4rA19BYF+tl
         pFyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm9V5THFJ2wffihhf0TvO0h84xSYehWRaurJZ68gHEm4hoa05d16AdZ/x1pICmAPvGjZMUa+D426c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWiVH2ffzt2ZzL6Lu95QKZo5F2zhRrYcyheDJEI/8yXQKslGLN
	FcUqKasY5XZfD0O29BC5l+PLXjqHEqbvQn32QFxIWp408V2sfozPdpQp/F5PR+0X6B0wdTgv0uq
	tAqZlqVUfR0CcMr/uv3FNwr8k7OnpBiEDkp5kb9uD6Izk2dNdvUD6QtpC5xDqZxU=
X-Gm-Gg: AYBFou2QMIBnAy6bH+qxRNJW1recjWex35QDi0JXvb09OgCb2quMdpiMPbQjzmRsuJE
	TnoT24HW3ztTor458Xk93ZjbjwXAR5wMM0fT07BVtZAgOUo77xzmWxHlamjwmn4zwCztoKUHG7z
	nG8BbXmRIFmDK1zjxWTMq/epJ3iZmS1n/LOTd0A6xe4P8o2K6t8LyuQLhlqPrGFCfHCsgP6sEsK
	3N6dwmV1Ze1nh5MiVP93ZsKe52UCzUcAjzirT0SzuGeMTTKOigt5VMD12xchCMF3dMZEga1uLGU
	GPFgoc9ivuj6aeCuNF4ciVUbChAfa5EwfW3z0kA2RqbNBxRqZNKO+lJnLNaFrcNVVc+VPdDwUND
	TT31XQ2/dqaPKvCm54S94bQ==
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876097685a.2.1792485224632;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876094585a.2.1792485224147;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf123sm456787166b.14.2026.10.20.01.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:33:43 -0700 (PDT)
Message-ID: <da0ec4b6-db66-4419-adc2-9600d8cc5793@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:33:39 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX2UdFKdGECMgR
 daCz8nrjECLj/DtsEJOEyeVQvNs6ODaiF+Rbdc2a9prfsuAwCueU61nqO3CNA5FsynVVI+8Ll5D
 vgBtsdpdAuuBHe1YKj1L1D+vlG4KBAXbNWc1YloMeMgNiMRhZDs//XDMdZ9w+5RnUbEhkHbYEM3
 RAf3QN4CQD9rGWzbggbox7qZAxk//+d82VEbluQtvWtWHV1huEK4YNBCUjJcZsrbTBusSTmK4Jm
 g40p10fv/dqeZCY7P2fvAWL8MsLTj4fo00UctE6ADntS9ED1Za/o6EFC6ZqS7eM7mkIz8GhL0U2
 Zm56+5pcS9NnkVyu/EGv+aCsGTG/NA4pdPnQm4QnHiCd+asrZiYOqGgZSKZWee+DhgqBOeTUV49
 ikjgoFesh6SRqwY1rzh6q5coKP1vxYUC5Rom7Q0xMQ69uDPcw69QNnk0R0JbJNtShQ699bzIlnw
 aw1M9Wu0+r8UrDJwKRw==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad72769 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RaLkOdssimeRB-vWfmoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: AWmuhPzAStbmNAbb0yhqmdbWJi4c5q2b
X-Proofpoint-ORIG-GUID: AWmuhPzAStbmNAbb0yhqmdbWJi4c5q2b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX+jsBw9WeysSb
 2MUbE7o3vq2hfIQs+5X1DLyUbpDFfQlf8IgeWjeYnlQakCeRmS2K7CJiwBWX8E4EPUFmut07xjV
 IkhBTTGEZ2qztHfOXz/q/P0R7e8lrpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
> builds the parent request by hand and leaves best_parent_rate at zero, so
> the PLL is asked to determine a rate for a zero parent rate and the new
> rate is dropped on the floor.
> 
> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
> rate the way the core expects them.
> 
> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
