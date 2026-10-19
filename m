Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C94E3223
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409918; cv=none; b=DcTxZaYRtv/1VFXhmWXPY02C3xYqiqzY0HQSKT9Cj7l1dor5Mp3QRz9hxL5Kw2BnA3B7ogCbedBAmxkYx/9MwoqivHRIwDRV7YD0jGwV2oI1SbebqpbfWV9GnNaFVuNRVNeBFILKcIWIhC8oRxViHGjhZSdEt3FSo6mrTj1bsqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409918; c=relaxed/simple;
	bh=QOs3o/03oscCxG01cilEBA+6SNpiI2kfLVpehrEqg/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqLrqkXizLQ7WOLy4tUbu6RuJLTuUjEGLhsFz1xqKit708j4lhgQjUIW0SrRth+6/f6y1KAtIuyKmhTBuAN43zEv+SrJED2Fr3VMjy6kVqzltm00Egqo2I6YvBWItIQUFbWt7AyWr2lRYoYY6XgJCIx5OA2Z0+ba9cose5VugJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inHQGRQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsYmZ0VC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inHQGRQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsYmZ0VC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5n11896537
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=viCG28a9GrMyDHchBbUccE9n
	1Q9GobJDehgmh2qVkOo=; b=inHQGRQ4nY1ZqOcaxktOu3V6O8YYVWRjNJ0n+99B
	1WBNx16s2n4KqTG+fjvZUpYKd1/SYax5M87hkceZI5HswXLv8qBLlUSIduP4E1JY
	yaCR1uxyGqbjht3Y8o8Fp7Ck83V8zV0mnTK+cjaO1MWw5pNEOXkCySz1k8ySxEvj
	bfbfuVHQm0v219OGpTTk7ZHnG0TkK82PvMB11mB4HeiOdhCNyIfZ4LfdLDJBcsx5
	V5jxtw8cEhPm07BxaN9VdjNnBnh62k0FUZ8C18ee8GjA2z/x81BkjdOAsXpS7HGd
	nSvehQOC3+6N9GjjPwhK681N36Qvo8jHZj/ZB1UlwLWkXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9nkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so707897285a.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409914; x=1793014714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=QsYmZ0VCNERu+UBwQ/+ogJkityK98jcKidh9cHld1JxzUSvjgjDwC8yYbme+acqI4y
         l2Yux9BlfNbYJx7OvFt8zPCyrAQr06X/nvDkGYK0c2H8XPQTy404pj9mGkhutVqQ02Qc
         dSTkWyK33DG1JOpSuFRcYmd8yCtUA5b+ODApkk0U8tuMl0/NSPSdxe++cB342n2STSp+
         RXRCaX9D4gHPWfrVC7CszRIB4R2UTyY+q+Khf9pa3UO1cIaQy+G+cJOnc7SuxoWrzduv
         qqJaUv/8ulFVaIhQji7r34e1MlupsqWA1eV+a8+Z7otNDND6KLBh+bpDIE/HyG07vsgA
         27jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409914; x=1793014714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=iUrqSd+G+wq2IblKusWy6jEiZUynWuy+P1a3Tc8iqGPwl+iJYHff9P40j879mi179S
         eNG7Ct1k7svvizRizG3iHaq6emkJfF1xu1NS/WYaxl9PubsEIv9HWCR0sL7t3CzltBAv
         XdepsD81cX2LLEKPbDEvkWruX0i2eZ+Wq+tKw33riOrVNu2xyrSRQuyfgbQO+BXt9bYc
         t9EZ+7qUVy/obQkBP2/kINBuZvGrbxU0SbhrGAhHpMPSPOXfhDfA1NPslPcBC+pOqGeq
         1ua793gacyCEmIioKy/QMGV9mkSM03O7LPswpcs8NdSih/+0OXvwFHkANVIwlP+zKGdA
         K2Cw==
X-Forwarded-Encrypted: i=1; AKwUvByudjNYVFGod4qLPjTcrvzKr5mLLhuUcxlRikACHc2cNcX3huIiEjDw+apZ0zcUEeDqiQfQeu4HsKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY+LnLbwMgNH9w/+WgH7rZHckvZ/Ex57B8UKVphJ/kaApQqQfG
	JnAlpvn2tcQu2kHLQXyoxdqSUzsolP90YSb+BEhPmkaGpB9NSlVrRcXCgSz9gqlSkjDvDgptKWK
	R489cAKZravDgiufo2uxAr9SRmR0za+ugvsyyIk0LgUz70nSzyn59Lf1yhq35IEY=
X-Gm-Gg: AYBFou1+qe0QgUSXPhJ34yRiPx+Td9SfjN61dbHTmMBT549nyf4CAM7x+vhRiQHcejH
	p8T/B56eM2gAK5MRV+sZGhEaejJ4XsQz+LWq8zA4TLeCRHTRbt8L24TUd4SSHm/sXPh44RuI0UJ
	aSmjIYLHUsgeFMIJ6oQnBbvtHFaC4ElBooTbjqXblKWEZibYShObvaN8xUyUmlgRY0ZwEhptwlv
	+KhyQ3KKOzN/s2lEiSK/G6Dd8EA3TEtPgTg4onShbxPDeyDlLGTL9ZLcz2WgPouVphfYyJSGQHa
	5YsScdU6YJZ6owGRqfdCkbO4zbpvArwA5tYPa4LqmGaMScuNwGF3Wjz4PumySDDAJFKT7byB2mN
	l6r0ArqzC27oNKNQf
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247868185a.54.1792409914247;
        Mon, 19 Oct 2026 04:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247864285a.54.1792409913562;
        Mon, 19 Oct 2026 04:38:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503d78sm22148555f8f.50.2026.10.19.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:38:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:38:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
Message-ID: <v4tz3aztvv5cenofrksn2g3amauzq77sk2cakvqoogqbpbmuud@cwdziqxeccyp>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXxZaHsM3aqoiM
 kc/aRw7VAXYEy8f/smx6Q99spZlD0u3yKZN7WWPRmadD2XzG4p66rrahLApR8Vco3PRCExPdkZO
 p87lVyAsawhV1282tgccclbq4KmaZ2NHWYgWUXkLLtq8SUbGpdqFWSwRG3A8ZjngTuGg0yaVkZ1
 tCmJjaaoZXWMd98QtUuv35u/ZB8SNtMBuUgpPCKNxSr0zg/m+8PhoeEvR8yKiABcoNTghNPoRZC
 gFvb+MsJlsKiCAC35IFh8Ba1Zcl4Q7qrpvCsaJuLBM117PB2ROZ4FMTMFa/fOEiBXZjT/Ky41io
 Fasj79e+KkcYK8M4EktySLvSiZhOQpVUBWavOixPw0xKtoW/Y0p0N6iY4nReOTUUptUxiVAUHJc
 z2qhDfNqm3PQqE+V0Al4sMZAqtdRRYyp4gKu1SN42N0d8JFHW9a1/l1TMvS6hzSZ8fPUz3puR1E
 dLhGdGX+SLTiWuhXaXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX7uBDQ77173Vp
 yGFBeWgq0kqOGr+jWCwLKVgJ8q0KtX225p+2HFkMY/8QP/fTx5HR6SFx0wwAZTC0M6wPwff+uJ0
 Hjnz33pa4rWENFkXYeXhWw1oZfKSgpk=
X-Proofpoint-GUID: wxbu8OzbarbVUHu1qUbJHCLoVewgIkFQ
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad6013b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_C40RPqcRi3kUEhYcr4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wxbu8OzbarbVUHu1qUbJHCLoVewgIkFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 19:05:04, Jagadeesh Kona wrote:
> Add support for AV1 encoder clock controller (AV1ECC) node on
> Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
