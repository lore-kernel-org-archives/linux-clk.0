Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479366;
	b=gpVeSRE/AFvRlbBr7saJ1kQ27ud6e8LHLZYYZRks/LySOUk13DO/lW7hcfuV/Iyz1bkP
	 FIDZSiIkoaFOV9R7z9KnrqebQFD5jvP7MdB7CUb3pH6tyAEoYI2t3dC9bRgR9BAheofEW
	 BZ2k3G1v50BA7wF/kvNbgad/BraFPTpDlZGVQyAzXJM6IwRjwdIXt1hrtQUzCdT0zq3TT
	 ElZunMADc8c8zNVCkNBQhr+KAqf7akLKWovoEo7cr9qBhGT15045/wdzZ9S3+OuiIrDBK
	 9znxWs7Jr4vXR6c7dnrXPw1GhtKL1qE3HNEVSIgSbz/aHEWk2ov+vSpmtpb/X6/xkmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
	b=DWvu8tljKqpPupN+IYb28va3ybR9eklD8A78R7/anyIs5rFNjrqoqugKCUSd7m/rNMTf
	 esaw2+2eH3ErdnD/yzTf+MxemjNm3vhBkSDWPYyTUNahDHMBR+mb06BbWlOMxk2We5QBk
	 Xr0+yIEvpk+Xn3siZtYpRbzCePZ5zkJGML/yG60YJMH7geTjMx/eROV+4EICVfQ8VEJYm
	 FEOLKBiaqcaSUZYYoSLI+fPAo1RhuORzcei9kDu+r8sYIPkWWzgS/pCPSE3FP8esCjJqB
	 xGhe2CNdPGymHLho+gHMkb2jijcjF3IrU/x4pVK1P3mHhLyNzqtNTK5VUXk7uD7bD7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B3606A31C
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 931B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tNxO3306125
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=; b=LJqv1MbGFeFQx84y
	Zqz6oUMNyzFnRgq3tErABOkJutRq6QiG7S1B96fBnQbvKSYwkFSsNmq0xHBAic4/
	24NuWOg+E5S8SXFNqGl82RkeqAdgBRsErkHtfMKScdvg+xUtojufSzxRjak9bvS6
	YIyH9Z9gtg2qgzYpA8nif12JKlvgWRCBowca1GTXkdBWLxFULNbrRh0bYWcGDcH+
	BDm4BvITu4Zwja+2tZWginft2Yh4I+ppxfff+IJRdxJZbYZbQjB+OZ2hHendatC3
	aIAauvR6vd76HhDex17SrBakF+DDlfWSZjKgxm8dId5F0L6KhTvGrzEjOZdQr+J8
	0Y1joA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ss7wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:56:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so71688385a.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479364; x=1793084164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=OCkAyclT39dKe8WemJMWfwadm7h+/S4s/bqHNztCjcxHtsO2XssNlMymmq9oNB0i2j
         2jXeEG8mQWFius+7z4o/izPe6iwG9qE5PneEGwkFCwbVmQEBlqpurPO4gakTBe41pEg/
         aSx6PKaUBUqu1piXwUuYvaK4GPJu79w/PYefmdgohisspjEntddyIPrDozL6RU7gvyzm
         3/RAHJdv3/Gf0Az7t0ZrNvsciQB0FgMYxEwoXZueAmGlb1kAiDOjVAVz1B1t6Yuuw23g
         BbQK/a/n8nTWZYqJ7OUCC8zrU4AI16jc3cf91E2CkVKAbs+eJL2kE6jeO/zQvvF+cBby
         /JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479364; x=1793084164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=FbQhqxpe3OeElbIpNAV2pzxANhFwjVHGL2K86JvCSBoA7QQ6whOKieFhv8Tv01ymFy
         NS+Yzx3/GTLl+hb2SibegVaKX2qSxp3DAA7tjGm65I2NjmITH6FnN0VKvTWyuvYq7QfS
         tue9SpCKhK1uK1by43DNTwYiMjUeGinVhzhgu1vhO8q4cc902ijbBkCzHqtaDt+D2TYV
         o1BHd89bqRpM5glP+5+ylXrsFNWcuP0KX0NV26cr8QcIBwS0Iqn0crkobcrxBnPtMAOR
         2Fay+K3L6zKCRoj9vsza/S5yVWSo+6LbcmnpC2imfNucfaxjafLeMwyXyjLErrfwNQsP
         7AjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkfJ/ny8l+Qb7vmoV9WWDVh1VlWq7OVB5SeXUi3DReZgsXlzOjxedP3ripFtUNCIeR5N2rLl60kjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAM5wyWZK2GppzEYbkh/Uz4ZsR1cEl97tqVQw1bSV/FEK0xr1y
	sILh+4cfypNcbM+llOk8cue++EPxn67XtvWh0G+s0ewZ+4Oi9pvmcy8oL5KU2LmTofxuqibzMdy
	KHNoN1YzM/qX1yGM2XgN/0CR6XOvDrZa9tnXBIxWMjy1QOifsg/PJBV/cN7It3ho=
X-Gm-Gg: AYBFou0hQzR8TfbfgbC8WGg+2AQiml8NMs7eSdwMzylTtGaGHGSFtQufWaFpua9XdV0
	cR4Gmvt4mTnNsna78IDkCkKh+YJRYuzThF5EY19HSg+9WLn1ZBgd9yamngk+Ik/HAp6jcxOQBB3
	UR7lkkc9AUCTBzgdXdOEzfHwZNvhcP8hXz7+L0D/R7IowOyzCCp08r4w3U3n9xWV3CclP9sAQV2
	1GrWMFaPcyYE7eG2R0lxvONtSZqJMDeq6WMONczav7UBMb5kTLH1f7ifI4FzUi7Uhea4uBtPINM
	++IN0J7vrS347DJeQE42olczHMZAzzdkSoHDUv3+24fnaUqNeLXszlMubH8VdTGplP5dHZu5Uns
	WC5QnHDiGqpCvLHe4yMbv3A==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922701285a.3.1792479364042;
        Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922698285a.3.1792479363583;
        Mon, 19 Oct 2026 23:56:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3dd83d3fasm1305197a12.5.2026.10.19.23.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:56:02 -0700 (PDT)
Message-ID: <e043f9d7-fc32-4631-9012-f0dee835fff0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:57 +0200
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
Subject: Re: [PATCH 09/10] clk: qcom: cpu-8996: program the MSM8996 Pro droop
 code register
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
 <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX1jRhFfsY2zNN
 aOUntNJteZpau2dRhEfsMYrD2wj7eRQ849aqC2tPRHeu2wGpTumBu7FNV5QjUuHd0Ghdlh7CcR8
 9rrt8XokaO1HGzjtYrYKXF4EEFXEfBtszJ2OgMLqpkap1o6DBkbKBzLrj7sDaSVDZmyfmQz/Lkc
 O9+2687PCzt3WqlW9os4ocZnfrQe2MWsqBPrPrccabucXgTsXXsAnsRRWszA1PFv3ln3Pn2OQ0p
 51nIogGSFm0eP34FkaVm4mhc3+l4w2DesToPV9qkEEXWf1dHBxCgou/79md+Yz/0v7NOsW9MCnd
 VYutQmDMzJjJPtZ/QyHFrjFjipFT3hdEi0iW8bR1K2fMRvwiRO/ZbM+IDl1OOuRt+Y9Pk0FyT84
 B+SR1tXzL40He47nkrYte9WzchrsYliv/27k9wpoCkAll23/dvTGZZnQYP9/ovnBKsa+XiER0vF
 zvHErE8ezfVRwHV+PlA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad71084 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CHr2jc4OuQYqXGn8qmQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: U6UKrhKjmEOifSM0ird9Ewi-wsmPdBtM
X-Proofpoint-ORIG-GUID: U6UKrhKjmEOifSM0ird9Ewi-wsmPdBtM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX5Fj63TIHKMJy
 Sr/NNzTuSmCrMuqXnzCe44qWwUeLAWRZFKMP1OXaQOr7PB8zxUjxEbfhEh/iZwK61rQcwce3vIE
 CIMGD7ttJprqFlkI0KDUABGR+Y30Rx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> When the vendor kernel enables ACD on MSM8996 Pro, it also programs the
> MDD droop code register of both clusters, so that they switch to the
> always-on clock source when entering the D2-D5 low power states and
> gate the limits management clock while asleep. This driver enables ACD
> on MSM8996 Pro as well, but leaves the register at its reset value.
> 
> Program it on MSM8996 Pro before the clusters switch to the ACD leg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
