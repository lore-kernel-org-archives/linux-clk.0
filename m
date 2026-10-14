Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A344A9D44
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966505; cv=none; b=D6LVhfBWGg1MO2TDBCIdM3n8YcUZTCiicOSeyWjgXIUDrVeJ2V0qUQ4tJBzZ+QMv+IpGOObakvELu6tx/HY0A/UwVAYlgUCgAr+ULI//9jUCQkDek2rme5VIRB+m6ZzGm+rn28G0L76mUShKvl0l+KlWW/oFDlbnjD5l7tnWboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966505; c=relaxed/simple;
	bh=PxjXnyE+J/xpLz4nh/Ja/g7djpWi6xUNobr7X/sVQUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRAhfk4RgoHgT1/cvKhJJRb0JQ8MpB2VgxJSCf5sH29An0hhNBE/F/kjUh2abdmNd+84wGiI29dU5pjuafOHkYV33eap9phq3hm4P3IO8kjvDUVWr/467HdU1zmzrXBJQ4j6+b738CJveC+bYjUOQZiUnc2cAf867e4LXBaaFws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LK3z/nxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAVChM9u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LK3z/nxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAVChM9u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67mCd2685347
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VMGXmKefTrrItT0jKBuyO87y
	HZi0iBu9x9zcbx+7vyg=; b=LK3z/nxTu2GBiot4PpxndfrEDj6eMsxiXeaeVsRA
	XPsIHDmSM1PFigi0k+1nv7REGi1PfAB4QOYtUS5Zrci3l68prhKAeWynglISBHXG
	apiHW2ehCYlKq0t/+7Cc0Lt0+WPBDS5uROIOzJGI2CMnDyVj1JNEB4UnWb47pGWs
	HvA+34/xCqIbUk5+RAPVAgAVW3owAvWDavuCW/WNvCrSYGWvlyUMBQfKFCSyw83c
	Q2zSQadXzC3iVrLyIISJfaOAhI2KAH8IfYJzT3H9XlsxCa/JRZgwJzY7SPE7AqmM
	McvpUCeQEYsEQVaMK4n4ZQupWnZ9a8cfhypjaNlt49pi9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0j99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:28:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso16398785a.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966503; x=1792571303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMGXmKefTrrItT0jKBuyO87yHZi0iBu9x9zcbx+7vyg=;
        b=KAVChM9uH5SH6rBc/NWCQ+5OBZgNKHi33kuChOApRADWPE6YAJ48GYjiEaheYy/iKc
         sRUTc7u/5uYdyX5ltR1felyX6ZO6elcx8kSfUWTu0viufcJOR10OS0z08Jd4uTWlssxA
         TEA10xsyzSs4KBjwl95rYJdzCkaz52E8FSbh4hjn8cRNhOcgSwpMiWBzbldrw8HHrP+B
         d8Ys9dUcEwUNUL9W1U5gbdGbP+l6Wm/ff+TGI8p9583BmVecX7Qb/FI294ibi4mXYjiN
         ZCOqTr/L+RAlBZ5dW/yxqueJ/LnOwQkwRjxPC0ZRsWjgERR0av+0QH3rvtnGpQ9iN+ig
         vNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966503; x=1792571303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMGXmKefTrrItT0jKBuyO87yHZi0iBu9x9zcbx+7vyg=;
        b=uXfeodwc/6mvtFfpG3a/24Tq3IlikXnbOLLPPcz+RlGZQgzbDgI9AaxtUDrH2ddk/e
         SjB6A6AFj2oRBTonjZosaI9X9VcWkRkhQVuwqOg2dGmYOuJZ6R/jEiKBHCjUqwa/cs8I
         u7HdCeSF7O94IVWdc1NyZOb7Si79/3+ikjjXn9Ot90Tn4ZaNjraBZAzwq/ke1XT75eS5
         7tFb1jnwOu383S3gNBC7uIXHtABW/TrbblK6HJt6Z9Szwy6DgUZ2w59JZFEAHjYeEqyT
         upZsBAZSuDDZi4PbBK/Bb490OM6IOSj+096GnyizflI0icNMUfGvYnjhd9xm7f/tw9ox
         Izjg==
X-Forwarded-Encrypted: i=1; AKwUvBwEMp/Yemv/jHbUz+eQFve3+z4YP5xaYSkhZ/xOSZMbArD9pTph6CRdrD7JHD58BCPHti8jS9FM99Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYGljDHXH//B9M9eo096HbThGnNFPo7elq15burvj7QTyfXgdO
	6DwryKWVe8bV5eVlS+S1tsIWMmIi8hxkMeDEGxaSiVZmRjxcaeqhXTMFs54uc7fBH/PYYGhlIWM
	r5lbmZwfXIyiFNU5lV8sgL5hb3FZiKUmqCXq3I+79bUMRTC3yD0/rPeH7kTOYGKU=
X-Gm-Gg: AYBFou04/vdH6ce/EHK2UDjxvX08RVpIqya10DOGgfQfp71g+IuTEZ1BRc3NMN3pird
	gAyIjmQM7ic5VlSzRp/+8KgagcCZkkfV+PB62qQxc12PuJXXp/7/jwQ6yrTSPImgw9rOOZaQMaw
	EWfZU4Ii9v5Z/q1EFnUkRO4DN0obS7M/vzA7oy0AVNmFQ/CmHD6A4VEyI6ON4tKzxW6ZxtCLznh
	ka85T3f3gcXhgS32+xTaiQly1vHgopz2v+CNJ0WcERy7QtxLdzdv7ipfk85/nGVZx+DznMeRBX4
	zm/vgBX2/FOkeNHFyLYbAbX+rsBGH1tVEfaqRdSiqmB79N6XrX8dM+EYcPK2RjbwkN/k59AcsnK
	B+OaRPV/xXbbT1kEL
X-Received: by 2002:a05:620a:710d:b0:93c:66da:ee08 with SMTP id af79cd13be357-93ebd2257b8mr2355776785a.14.1791966502596;
        Wed, 14 Oct 2026 01:28:22 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:93c:66da:ee08 with SMTP id af79cd13be357-93ebd2257b8mr2355774085a.14.1791966502013;
        Wed, 14 Oct 2026 01:28:22 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm465803755e9.14.2026.10.14.01.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:28:21 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:28:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <ifufryrchrnkxk324wgker6qsfpscfydnd4mx672f4xnstbleu@2sbsmbbxb7kj>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
 <20261013-icc-v2-2-196b219e25c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-icc-v2-2-196b219e25c1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX6uunp1NB0x8C
 RdjXA+wEIX4dv7QkZCvwU8HrS0S3170E9oZK0773e3WGY52H/eTuBWS34gZXe4sTRRouA4DOOSB
 9RG5qjYfIk/qQWlBxK5aEXI9kokPz1Q=
X-Proofpoint-GUID: ayCTxlGcs51pmZ6_HzPsxxd55CQUH3mk
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf3d27 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6-BTNVOJgJThklozbYwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXwmY7DrMYyCNu
 4Xkn9t1QXh6hpId5TJgoLGb31CWzoa/A13MfZkLrnrz4whq6Z2P6MHPO/8ty0ZAu0mtZeDzIVU7
 KcjuOFbuMHDIzyt4EFx1qZbHC0wf4nUN2j1NP36EpVypkc6aEI2PbWb7YLjcklD+ag/RdbbqstF
 +nhLq4a6vPr6I658ktnjqTNdqpjy8otJhDHC1Swbne3Vf9wCStZRexgcMSxdiRERkE0DTTwsXqf
 NxEgpnHxzyRxjSxxWGrnKOuTpmfBFJF+hWN3H6ALqNQbtjLKSkglAbRvqTi6o9f/1e2plMGkLSz
 Tt6Y5ibPNwSyxrQ3lP8V4CvDy6ht8oWhHWg+gL2uFkcqJtIIiJzEllWTGQzTp3NTN7aHq0BFdCI
 5BOvBLKVCSioDsf4l1nHJFUhF2KipDt4ult4XWg3NvE4LtGXjjB0o/JJs8vv2adSuXI1VXkAEId
 eSkWluG/fFIjIDVD6wA==
X-Proofpoint-ORIG-GUID: ayCTxlGcs51pmZ6_HzPsxxd55CQUH3mk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140033

On 26-10-13 12:39:44, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
