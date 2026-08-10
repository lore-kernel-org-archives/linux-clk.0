Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91921A42D
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365040; cv=none; b=iJGoW+8Eal/k9ndS9vnVgDJKa50yPEybxFfcHrz0MxOplBJfCJu8QfHPaqBhdsBB8Nv3VwTfRf3tKFZo0U36r9pVQwya+g+ouB1hQ5muGYe3MQ9dqCu7jugCe1+BJONkx7GRdUnM5dTnof5eS8o2x+10ggLtUCfeUaVx2KC0suc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365040; c=relaxed/simple;
	bh=+T9fxPcqvt5uF82iwF6LbyuG9R0cQmokReqYZr6ZFwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvtqRFmm127lbPQifOStXIM5Mw6D8KEyUT05QKjQ6tN7tRBQKHedWLbimpWUYxfcs3S5HpnhGzGrpQ3estHYAA1g0EFKBOocdELzw6IRVHRhL9FriLP/rBuzSmOa+RtVwxYmvuJ056jicexnByuXvrZbChcx9sciKpc70FK5Ewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIO1c7O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNwqz2gI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIO1c7O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNwqz2gI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9STAx1119616
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6990+4gLoIgUrP2vyV7AlLSF
	3GtnpXF45SUirxMl9R0=; b=ZIO1c7O0BUTRrLkenVpYq8AGs9/bPw2D9OPwjEsX
	DGdz2atar3rWLA20KzP4klCYO6Nc376U7KF4pqkDQKMjd7XVbjhFLyS4KPze05qr
	S0IMQegCpxrqc5+wgne5iGe2sQeJ6Gz5jVRADqwje8kb1nXIeHt6qmuFbgAaAmOW
	pmOzx/cF0cxV7eY1Y5VqupOeAqA6Hor6Q3Dz97AAkxYRJgi+8tjeiS3yVY26tqCT
	Zcn4X3zgsybUF6/O9cUJ4OWud84uVVMUnM5+mzjw+WGZ8zQgwV0ROsUYpurIfaZ0
	+J/gB0B5eay8QL/oet0I0O1Hm2wfAhUtRg7CJGoZFrsYrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6shab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:30:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so34320771cf.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 05:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786365035; x=1786969835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6990+4gLoIgUrP2vyV7AlLSF3GtnpXF45SUirxMl9R0=;
        b=YNwqz2gIUOKxTzqX3QaQ6CrYohLaI2L7/+Tr/qV0YbQnJm9VCFHavwHvTc9UStbJZS
         t8WCwPT+Wzsoc3oMqjNYSUbFbKIansZw3OM4edX7auFali/yZShRq3vnjY70bUGpj/hi
         2CEq0e5z5t79fg4I8xCd2Ky0Hf56kePGOwpD/4uf6KFjcEwv1mB9hPQdlckrGSxAZ7Ej
         sw5mmSgHVqPhadueVBsr7X6lYMdheMvGRSss51C+VuVSMCJAVTi0dVIdf3et2k1Ag9YI
         ode6uQvAW/GsLZm8dntDlyhopcnCjb01wY5eWoAvdRdUfKZKnFkHU1ylj/KRUerFQhB6
         IAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365035; x=1786969835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6990+4gLoIgUrP2vyV7AlLSF3GtnpXF45SUirxMl9R0=;
        b=si/GL0CSadDc+IskovDQ53htoj8fwAdONqm5RG/8gail3g2UOIDsWjzVx1cJn/gc+z
         +kLUIAyNEhD9SEEwsbZewjcl2o3qEcpZArLe/nnuJ5TajE7K529CAy7FB/6DG1JkNAxA
         gMQX/QcCu6GHEb7sdZx4vvkj4UZratNu/oFntGXvl8EaEnPUwNcdqsWXIOH66oSMAnSX
         cxwJ1m9riRq3Cm2jT4liOGbnkEkj54dVKiPDBltxPmhBxQoYXoQ4/ptuVh0tDYoIM+ls
         UqSChpi+X1giDYs9Id2HrDBg3eE1xASa5FPYYhUFBvKU/nEOPVop2QO8MWhVXYirpM+4
         T5yA==
X-Forwarded-Encrypted: i=1; AHgh+RqFMAV6ltFyXSHsXSljiQ8W129gOFUnCgw1q6uQWZFZkAnL1Rmj2TdeoHW28w4ZfcvdYregxOPRtpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHIjAyWdQMT4rpqckc2xrH7pIdkzs6oPnediK5pMohz45lD6t
	sLGt4+hKvKCLCbT4d13300j6lqyCMYQFu+YEpedpk28J+pBO1n7er4vyRYkvqjShRye7IJ3EN3p
	1EAcuwMl2s6mDDTeCnCl1KCas5is1lrc1tdx+idB2P/ExXHIN32KVvHMAhL3ZP8w=
X-Gm-Gg: AR+sD12jvYggGqFcdyzZwIoegACXLth3IItzh0g4xAnH16SeVXBP20MXWMxPjnmzwi5
	872VZ5tmwlyw98eDpuTUaSPe4zmjyJGA3+ekJzaWkEW60DnRx5910zZKDIpxsFAaMY0ZlFqo/VL
	voDhT77tuhcBWCz5+UsixABxRVKLmyDApCKUa0GfiD8RdOo7dW6SkNYC4OIf7/tj7p4Cuz+kvA/
	fBx7cFB4RQFYKcYKnd3fyQiwGBT3IBo5yR8zp1IrEHx4iU92/W4cTeoLQ7935uv3yJ21dylx8iz
	JdqYilnPRqOJV7HTedbs69Y/VR34ioEVsqV4p0UXYXyK4ObnOYfaHPbXwkVFyhruFwh8bDwTgoZ
	C0JHdH7g/oUs=
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr340763891cf.24.1786365035219;
        Mon, 10 Aug 2026 05:30:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr340762601cf.24.1786365034749;
        Mon, 10 Aug 2026 05:30:34 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea2e038sm288451685e9.14.2026.08.10.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:30:33 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:30:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add Graphics clock controller support on
 Qualcomm Maili SoC
Message-ID: <qnkn3p3bcwou5endlvuqr63m2dvhzlt4iocbulnulrdjol2u4b@p72dfaawclxy>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
 <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfX8qFKPGtDEzxS
 m447OEDWH8qyibThod1Uvdw6YqAEVh/FV3V+WqzMYeHUGRS+XpJ1U+2zHQL69sUT8MJOU1wF6rw
 WZ703W89SuGmjalQBqwQqYDsAj29s/s=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79c46b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fCNx6FN-KcjCUQZW59UA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfXxXTlnkTUW2yS
 TXeyIV0beP5RUNZd2k1Q0wl4O1/tEmM5Km1PkQLJ937rhS32r7YIGmT0BlarVxQRd6yjJj0T47J
 BWVFgcBXi25463l9fgWqFBrZASf7e7pfNO+B+5umAUBJgL5Tn/jgC8HvexwcUhtg6WwxD3fy+h6
 Zq2oStSVReNoGeZ5HusaRvLs7Io+E2Tavb9QXKPg/vrhvjGes4rlVM+xfZ3gsttTPYlloUNzO6x
 JaA/pbslOy+FCavpBGeZR5RCD2j4xDPmi690i7DtckpXtX7xHecBkoZQBofiKW8frWJ54oz4x52
 fKWhgHmEg2rJybqvgn6Pf3UF8hjVKQLD9c+YpRVXNzM25rqRF+wWraCNm/uGLavlflP73yhn6rq
 xM9RLxHgxrJOkNHM9zAmZJnuzALcZotHHwJNjZDBMJBa23VukyeZYIUuC+ue3TLv83C0qdOBtXY
 35wXVJ7SGe3uE1ngb6g==
X-Proofpoint-GUID: Bv6_RmacNTnVJ-OYOwBxKnRgt4esLIgM
X-Proofpoint-ORIG-GUID: Bv6_RmacNTnVJ-OYOwBxKnRgt4esLIgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100107

On 26-08-01 00:42:46, Jagadeesh Kona wrote:
> Maili gpucc is a derivative of Hawi gpucc with pll0 configuration change.
> Hence, reuse the Hawi graphics clock controller and extend it for Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

This looks neat. So:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
