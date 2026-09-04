Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA848F85B
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526158; cv=none; b=CeyOPu+XB+UOJ6DVaiVcCByRXJnA48AaLSE5MbieJyUUcdMKNdykK50op9XzPLTakYpA6babb6pRKHbdGgOGoEItTov7dWFhTTK/bIa4Qa8BMppUaIZJ9DC86lKawiVL0Au1CFU6j/Rw0QQT2tF//ycWUO0oUiMAsxceyDmxKqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526158; c=relaxed/simple;
	bh=4uCD3FkDz9bxjcYN/3/lDqGUMS+biPLxmZeBLmbH+4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVd59FFAm4S4stgnIWyQV+GCKsezzmBa4LIszsfVICX55wlC81vzBOPw9xFymUZJ9oJE4Jx8swrqK6DY8vUqQ08ltZ3bcPvM6qrdxTaKrPlfc5BW8cJxTNdjT75HuE4FdqXiel8fpjTDgEk88qZRsVtQgPqWhe1G7hVbb5vcvCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZGf1kz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiGfavfh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZGf1kz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiGfavfh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIMhV4054047
	for <linux-clk@vger.kernel.org>; Fri, 4 Sep 2026 12:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fjf9Eo3K1S5f5JYH1uUJ/g1
	AeGfbugPlbVkWxhv/j4=; b=NZGf1kz25U5vQm0g+IJstunRFvBBgR7BO+veqj7z
	OOKGIIkZT1WHFkumvsp+NqoUD5o292spTomk6KFO00l66BPoMKUAcXM2ux/NL2p0
	ClNRL/EF4ju3LH3PMYKTxdi6t8IQd5AObSIxK3bP8iN861cPQhuQaGuGLwt3hfhj
	0uP6S6v2CNdDm4pGtjggx4TB+yGjaLMAI70lcG0DHJvVC34d//QmmST2xZajFHeA
	0JCbelh4Ey82KnRhcVd0VRA+DBxUKdJBjbG1SnXzowbK7G4uGSlWzTcW27n++eFv
	Fb/N16jZG84r6wBLkrc2OVxU5W+WsZi2VvKb7cq9OPxmnQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvma2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 12:49:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97ca6578487so789165241.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788526155; x=1789130955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=iiGfavfhxfz2eR31uRaYU40S+XkVD75Mb/fAWC19TauDBWnUKAW2r6jG25wENi7c1Q
         VIFDHHzvGKB3Mv/BEaKNZAcpJB9DygioxKqUSqthZZHtOKs7MOStoOF5dLIK9Gi+GCEb
         HSnoVT013oTbyriI62druSiNdzWSQGqL2I2W10kbjtf0LYtKoKwsM8rcA/GnnWtyHsM/
         S+fz4ykREw2d+4MsxNAQceVLkyotxPsjQOAub1Hsa9tkndtdkBHU5GBv0x/2IKErozVI
         sPmtGnrrAlBdafOp1Ysaegq8zP3tuagqabQ8itsn1kUMQKyFgXzq72sR/MWG5KfvZTto
         OTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526155; x=1789130955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=ndv45HIQrm+TjG6x0iJIGWO1nxo6LvtIJXPwEG/jkSD+08p4/Parf438Soky2jCvew
         QaYac8Gd86AUPUH/Hx9nl3rlIRvpzNtdEp2R/pOEe6FSfT0Dt0x5nTxqC9R0A1/+B+pY
         TRE7+ll8GIIjWkIQmz1RYLPp0aSx2l0fY98mhEhGPclej+S6q9Qrhn2U6PN1DrX+bj6R
         7th47mKydlC8qy54URxsyk1uWU9Ovy7g9yY1FLvdXM7bPJzMKr3kpzTbszXurX6tXpe+
         gob+w42x87FAHg8R/ZkrfZnkUl1LqFviZBByL487ZhHA2tHBl8R2lcODvkKMiWm1TeD+
         a4zA==
X-Forwarded-Encrypted: i=1; AKwUvBxf/7s6S3sKcHxcyh5CgucVUHRy1YNTnplCiEojSUBN2OAEPyA4TNR4uyUfUnDi1m/YvF5hWpuvmb8=@vger.kernel.org
X-Gm-Message-State: AFuF++mGZiYoxja/FzlOcOrZtvDUQvfPF9mKIBB9u5ydICw9C3bl7bwt
	EXUWvDPcgGF5PB+qpQjLApLieNqMBH6yWi4o/zpmQDdCwXVJ4miFtQzoU0tXBvMHF5Dr3RGq7Aq
	4B5QQXGPP3V9Mh1GdrfoqswzHi4YcX48bPMSkFLNTUoNOSEqeqyCcN+kGIBrcsDo=
X-Gm-Gg: AYBFou3lZt5vFzRBS/lQFH68xg5UvQ2TlXkGXUZJasYYh3R3szkhcpB7MvBJixn5nuG
	shpjdDt5aZauiZtL/PrX9vVeLoDQ6e+h7Gtn/nl18S1ktjCFFT9j5oOvV8zLBEFalLQ8sibRofP
	SMiVn7jqm0LWdk4TTZXy2vE7QtfjZjLXsxgaV0mHuUJ7ooiS/eYAjW7cZyMr5XjoR4/2mLToIG0
	r9jbZFqDvMfeLScDpvFZYFch5Cj/MsxxQ8wS4GK/70IxrliKpYMqA8/hlpGDSXqjwERAv23aRWO
	y2i/wSqlBwd6J0PQKm7tHYW5k6OJ2M6EP5V95F4nkDNZODyeocRMxugMpWm+UuhPpsSj+R+O6Vv
	eHaXXBu/kA6F8
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2020000137.12.1788526155172;
        Fri, 04 Sep 2026 05:49:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2019969137.12.1788526154671;
        Fri, 04 Sep 2026 05:49:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm135742595e9.0.2026.09.04.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:12 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:49:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        linux-amarula@amarulasolutions.com, Peng Fan <peng.fan@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <f33mv4dqb3gcapmh4e4kg6zcgbtmb5zjyh27q6v7cnuq3ajvai@vn5pkiyhkicp>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Proofpoint-ORIG-GUID: OkFr0gUktu6VuK5dk8cU6WCVZQ3qFm_s
X-Proofpoint-GUID: OkFr0gUktu6VuK5dk8cU6WCVZQ3qFm_s
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a9abe4c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8AirrxEcAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=HkkWczMphfeU9HmRj9wA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=ST-jHhOKWsTCqRlWije3:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfX7QW4hA99JTuR
 eocf9yKDhKEdRmVAilSoVBKhwVKTut403hzuX3Y9zE6eFa1tYv3TjVQtrsV6dQOYFtFi+jqSAIZ
 uOedXL0faMpRU+lBdWEMC7rX7HQa1eJr5+zXZLxkCOtVwVyN5k0146SFbBW2qDoBc68SbNtMLsG
 n50IxrSwDk2TQvggDL55Oi7a9oU5aC1Njn8MxPvm+Bz8ZfdjcPRfVn7F3o+dnilR1BnsXBi4CDD
 T/+KY8qEwr0iU5pBF7yYAjFrZ9HmMjYVsBRULsnj6q+FvnoCGPVmFtD8/yDBsMlUkKOuEG0zxPd
 wB8gEV+VcHGLN4DziNVDI1kMxpBnK8lAGJfaIc8mteoVDAtl7ORy4RM6PgS8DyN84mNiZ9eR1Qc
 aOnuHJbuOCcPlWxZF17yDsRXhnctw/vPV21M1YZC1zteDvhq8iwnwt5YhWQGVz0uSPKlceTTJzg
 SiQpkkzkNnz+99/oOZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfX4CZsYSJdnLte
 OJW3yfDTXDAOYDvQh9VVZwMeHrnSNolJwDJg42pcXjC4UyNky53X+uiaLv2eLfxLmTtObq6bn+5
 cM6YetCjxej5m7Jp4YM5QrsDJVxQ/Sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040116

On 26-09-04 12:06:33, Dario Binacchi wrote:
> Add support for spread spectrum clock (SSC) generation to the pll14xx
> driver.
> 
> Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
