Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170294;
	b=tX6rK2Ve1nGrdYUVuc4EoBTbNTmJq6uiOSrlk4n2wX9ptWVykR7gpYpBk1VndplXPSBt
	 GnA4emsnYIhT9JGxJKwBvORM3B9SqihXSUU+23W4LAe2qy/PxS4USZ1jY+JXZGjPzVTjE
	 FrinznZVlJ/9Hwr01slEKzszOUC6nT/mRBllMDaAYqvZbcOxftwiGt7m0X8qzTGUnV3rN
	 oyNrvS1+PAYdNQSg7jRyycEUbQjFdHme3OlDh7kad25vHbhMHv1rgYz+l3LfwbHMSywyS
	 gA5yL0zjEEVzavv807tJf6taU6n7NUhqTV0rz1LfoGTqwLPVBV2F4mc+5Co2usPyPDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
	b=LnD9kyvBxjbleGpn1SNBEEa+2XQ0dExqeBflNYBEU4B/Yb69cwaecwO0KZsVfiTGlEq7
	 ma8EPQf92qr0C4TmNO1+kVHQNUIBL629nW1HrYMbXBbaXkxZkczsNxwt5XHFjwY+eZzyw
	 TJCGY3HoUcPEo08HtW32YNKFcoAu4SzyvL1rx6hyEWy6HdSLjJ+Ev7lBhFjV6XxDFkZbg
	 iWF8yH/2xBzO1BDn4mCOJU6ZlTvC4CvYeR5TWYrWJvpIPPjGdN+PlolcusyRYlFntK1OP
	 7U+XSbQqZzWUraDyy56Og2rh5bPveFANyrzaWYwAOw//BcFKMowWVq+ih4aoTRW6p+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8E606A320
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC8E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq3Q144444
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nzLBBCOxZ1CGRp+RMhrY4PNI
	yoFdbWP3uo3fOhLpR+M=; b=SZGJSzlKkGJfixKeNEsPTNljyBzvJyaS/5hdSHB1
	9rM8ZtPGEkkj8in3rfofoAdHvBmy8O/+607Gbc1oVWBDKXuQcu1aHQut77IsvCyO
	OXtg0eiJFci7SDAP+SiqwYsDmRq3c5AZwa5rXmZDcFQA4SWMnXK6WD+HHWBgfF9p
	2P9UX1NCgJ1oj9Pa17Skn0rGtocFp6jpBDduNPmsbmVzld7ERlR0sscD1UwpXkTz
	aak3cfVzsIKdNYkWDcfN9jRvzLZl7u8ZcCs4veNBs6yW415KblBsbtK67hEf2Y/A
	W67b6VS89lHcr5JFAhTHp59U1mpRFP19clbxirUnNzXSVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh950-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:24:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so80354285a.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170292; x=1795775092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=YvlrrT+tqMldMGT6Q5jM7N6X0ZbDeEq7oihb24FRMFkYw61On/GcXeLXl+ZCVn8nzU
         /CM6reVFGVhwyf62GfRc6Zgz/D9b9fOvmBkjhmRiB2EY9nEfFtrXxvmGqwoXG5kdv8R6
         vg9nur+K0Z6H7DOCjnS/c4k64M+/rwcmdB31W5/SJSNft/PDlpypgaZ3txb3Hn7aShcG
         IXCPWRZtm8IQqWHa71cJLMyTj2JbsCSxj1klrDBVCn7hLLyGqiWyjwD/VK5E/R/wlYMp
         /dbkoEokIZkHc8H4FdSVAdcTCDPRbef60m61K3CpUBZGAv1rDqFaaGm2nGAsI+XRC/y2
         BE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170292; x=1795775092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=buJbnzpwQZm0AZc+qGMP0NmKCdaNIWv8j8/FVxqnIY7GL7wRC1Stgr0HB/7LumBPhK
         HoWEJSIRooDnnSzGn5/xsOWVhnIjTgj0fTBN8nCt/PS5r9BVbgG+5k5F7PgqtRVXuB0R
         ehxMdxhkYQCzzMtNo1JzGK20LXwTS9ZmCdDd8M+vd3/6inhCaGc4VxZjos5d6Y+P1SY+
         dIdhAWwlzyTxomqbnE3yueRfpU01ruF7iNB1wxRA+riQA7bI96EAhnVK1Bv98J3RNcei
         VvbnDa9UgmCYnIz1TlRDd+O8jUSXmX+EBrTci1ZTP8mWBk2DGJqAyEWFAM/BLNxAM/Bn
         zZkA==
X-Forwarded-Encrypted: i=1; AL+hErHYheclQ9+QXlLcAdujiMpL69AKYhuZLicuTMomIlvqTeX2qVnN4O2c/uBYlIaiNjj4FcHuZRaBUj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z9urP0wDkKWk2Z6sJcX1A8X1ksijcAxwXtEE+z/R31j0lvlyP
	g7Un/NGJFq4Sf6Gmt83yq7HRh24zqfb9osR79hpr6Ck/OD0asjsNLQRy92P3L7i2ywElFxPUjYR
	YEZL/qbrs8ZXc39pi8sCSMKC0U7SQNzD4LajNYBBsuUDwbC2A8IhAVoQxoBa9aQY=
X-Gm-Gg: AYBFou2gVtUHbca70QSjhr2eEYke9kbgjk1fgt2fyTnezT4Ygvf+CPzo1vs/N4yYdCx
	Uwm3tC4E2k8hnKhmV/mhT6jHZqCa2zqQpJsrcVr/nBtDxJ5rP8SmNAazuEmtn1cWAMdTt4Doiwf
	qKbIhvnfcCuklQhi2453HVBUKqhAJafaPY+oI+l25QY5uyymFUJDeYg+eqdsVjftPc8clJ66Joc
	8tI7AgZ9We5lv1+u3g8jaCht48VJS/7gp2TiQOch406SbI7jtRsaCiBrRpyvgpfSvng70JZFRUA
	6Q0Dkmzlk6KiJ8uK3+YWvO4zRp1KXz7yuzLckHJybRVwlnNBZePHId9JBhsE19ii3DCI8tHzswW
	gaoq+8cekND6S5Kcyg0Yl9f5fTRrqrIq0aGlU0zhiZcD4f6CcCrMX/kGxhWk9luWV
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462892185a.4.1795170291732;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462888785a.4.1795170291117;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm84205905e9.4.2026.11.20.02.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:24:50 -0800 (PST)
Date: Fri, 20 Nov 2026 12:24:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: venkat.yadlapati@yahoo.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Add support for Molokai
Message-ID: <ru6sqipsa7uv2schc3eejuasbk5pqfhpcac5eyq6wjbea6ryy5@7lu3miauiivo>
References: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
 <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXzoIXG0Wnf0y1
 7FPuRPchkrY4eQQFGdvmT8+nkdgLkbRpaOs4qziudTXzukOb4eZjqJuw0fLTTtFrkoimwtceN+m
 pzbXA3Dd+X2z59nsZiOAkQj7WOkB0XtR74bB+v6hrzbuVfh/gyYhTgEIPLQts9vA0vPXoHBNFNb
 86ozB2euSsEw0au49ZFDtBDGBGtmeX8YbMziAYxMtQP8QtuEuZYD+2d7Yw1N7UaC8Kw6NUvq6zt
 VJCyXwhSzbZQ0KY/loJJjFduz9KsD96PJYYvexSQJwCgMDAsU1NQG10izHYDFylnsdd7ts8ugJy
 xBheg1PhJ1tJwTSgUL9lVdi2w7aBLa4wZ3oq6rSfEAs1IMMFzP3/obSY1PBq7Op5nQQ/Rq2IjwF
 0O7kdgZKG/HybXgS9d3FNPlNjU99FBy27fLR55pJq+w1rv3ZKmZxCWSnU40D+xxIjROgw+arNVt
 eClckvXMI+hbSGmVOnQ==
X-Proofpoint-GUID: qLfrE3U9kBuDSZcbaVpnZpGy6QjlI5zT
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b001ff4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=8lLAj3oif3jFirTb06IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qLfrE3U9kBuDSZcbaVpnZpGy6QjlI5zT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXzlHcQeXLsl6H
 m5pE8PvsGIBE/KDGUYfkk9diwZV0aeNcqX8c2cDHtajlzylgD88mVZ2wyNvdEZkL1FZvio2kkG4
 MXFT1F5+C+bsBtEWZiXPSMsBp6SXd5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 01:49:28, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> The graphics clock controller of Molokai (SM8845) is the Kaanapali one,
> except for the PLL0 CONFIG_CTL_HI value and the CX accu shift, DPM and
> MEMNOC GFX branch clocks, which sit one register further. Handle it in
> the Kaanapali driver.
> 
> Assisted-by: LLM
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
