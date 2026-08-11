Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F343403E4
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 00:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409969; cv=none; b=t1J5Be0PJQzGpUQ3VafAV/MEeVQX90dz6WKx+Q6WO11rBLzK0ETBpqb7HdKMMuYMksHrwrCfzyGds5fZez+Xy7AWIh/9WXr76XC9UfoPDFfCp+Yh1VXW2jULqruxvr54vHSq/0qHfLHtGjVAisf6b/aHZXPU/k8EvchMLeHEA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409969; c=relaxed/simple;
	bh=CjQdVStJQcg91fypKE4K5Vi9xyVllTpeBG6sOBpJYuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/WeosB9JAwYBzW1bL1RW445FJYaiZ56TRQNOPzdXIEZNXsUK8MwgKVkl29iBwff/L3EwUj3a+xat8rgntx9ll7GYehUzD8jp1/2L7/3vkl+y9w2NBTDR4aABrIw/xdimmrCAqNT7QobAJ8BIVCFnqddBmpN/RJtfLDYFgZ27B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boGzuW7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFyZv1ou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boGzuW7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFyZv1ou"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMsHsB3311849
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 00:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e9W/tZpD/0Zo9zxxG/FneZtf
	2PKBjRMlIQfVAZ5Cf0Q=; b=boGzuW7dpQigYVrUnFqfcAXRPzuyN5Jfba/ujZeK
	4jsBl8VnJNbxHud9+5Nj4STTW8npTbZvxDn3bLp+iRu6dcEc5cZAiSQ3RhFYjX9R
	oN/jw5h3/EWCjLrhgaRadWhSr76LSHYc0sI+9i3WefzTWE+BRB8vnjcLvI9GoHvC
	Pe8T7juXejAz2y/iUMCsB8rbgSfxx4hvIUjs1AJlIpmRNDsaeylzq1SgbZaAmLzW
	KIXeCrewM5amBg+Q/bZ6wYRsgcje/uNEUk9uVd+Ym1qjMmmWJg9PBU4bOIVuUdyn
	Oam25Filam4A8zHm3QJXDbBcAV2sTVwMQumq8mNG0lg8IQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfsmcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 00:59:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso30454971cf.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 17:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786409965; x=1787014765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9W/tZpD/0Zo9zxxG/FneZtf2PKBjRMlIQfVAZ5Cf0Q=;
        b=EFyZv1ouKOxipAhpXtqg5KcHX5XwFdcX1lpOYkiVR/6/LtKGRW0cBrkr5IkOqad84d
         38wSbaiS2duLhq03epEa2xCEWv2knctuoKzkUrnbtCsIreua7uj4VihE08kEds1xBwAA
         r6QKxNPCOZXWQikcb+DwxTYVJdZ7X3L4D631RRjcjFGYMC+zMCZf7Q7Z/CDRNS20BqdU
         Ld3RmndbW9rIo1/jdGDHHDn8ozo19auu+yR/CYpaN3/7/KOFGcojGecSRZQe5baZmEQQ
         Y6RJl0W8Ifl9dX9KM5JNFjPPo9VUjYfc00RRKbgCE+SWchLd+jd2SgfYQ9IZ9Ohb15S+
         qVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409965; x=1787014765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9W/tZpD/0Zo9zxxG/FneZtf2PKBjRMlIQfVAZ5Cf0Q=;
        b=eZnu3QPiwdfnbBFNaxgb97Apm8YdaIVduAyrKWMKKJLImQ2uzuvGWr4ZY6s691LfH4
         u3j+JzM1/dHwKw+YlswwvH2oWwS076Hx55RUgqPZiBKTuVT/gMXbaGXz3b32Md0hYGjO
         ETChy7KpjRFAszTAJDYxNLpN0OhyLELq87CCrFUh8icLXD+H/oeW3eK7pK0QCO9nKpni
         HK6w+CYpwhH+rLuAVOvBMeMekP/t3wYdNjnD3LqvM2hJycAKaxKIBsg3AGGcimFdU7qT
         pTXvEtm/DoD7r5SesuKUlVnGfUKB7hN9RBgy3U5nPa5zeX6AOIWsffOMg5mAi8jtVSXq
         ic/A==
X-Forwarded-Encrypted: i=1; AHgh+RrPCmHotQ9V1lHQvn+8RPjLIo4v1lmtqEiJs5DSPbvMeR09tQf8Vj5B6YBSx0QERrLHN4JAeL9UGQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8ZS8Qbgf+vLzQ48+rxiRZKIGGlZbQFeLWmd3q2Zn8VEKuxl5
	NH77D3CXD6C44J3wXgIX1fT5QHeiTBikYEWNETGFLEpu1kGtR/qHOlfFl845TbDNHnG0gGH4AS2
	mh45bkrwOv9/IJzTVdhu+iNFuKECCioCeR83oTSpotYAAIjKdjXDs1ewEv4oATFM=
X-Gm-Gg: AR+sD13wfLdhgQHhFPG9UNBuvXm/NGMDRCaNvF7zBRqrJUnEtI3Ac+yKhtK7XY1p9sI
	ypgfux5asdHztThbpNQ2Hst5Qf/v24K3OtWVZEYuhUzO+E19YysplxKhq7UkMZ/HEL5L20TQXn/
	biHeEwxrEk4TgtqMOQkp90sSCMcx0LWBRdpcQtcO4PAqKX4+xY9usq8Mns/MuQLL5HsPt3olUNW
	ZzRdWkZQ1wcjqZAUIQs/1sxIudGEEVX4gCzZAYt+/XJjHViFkYrtA1vtsO08MNdtvlbi+cZoXWu
	3Ul7PgUkvWszKPHFWcAVXUL6A5g6Xqg3XBBhfnWB1c8tJJOpXxLlLPnxkTqfB6oBGYDAo3lIaiA
	WHnGI6YtAzK1MgNN5sxV50daNIKM5Uydd6y+m0QR2PbNGy7Hw3obNGM1N0Gb+doRjgUQc5GTerI
	jAyh+w4GBUCNVOcA==
X-Received: by 2002:ac8:7dd0:0:b0:51c:1e2f:1281 with SMTP id d75a77b69052e-52d191dae3emr263411681cf.42.1786409964893;
        Mon, 10 Aug 2026 17:59:24 -0700 (PDT)
X-Received: by 2002:ac8:7dd0:0:b0:51c:1e2f:1281 with SMTP id d75a77b69052e-52d191dae3emr263411431cf.42.1786409964426;
        Mon, 10 Aug 2026 17:59:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1c38sm2227656e87.12.2026.08.10.17.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 17:59:21 -0700 (PDT)
Date: Tue, 11 Aug 2026 03:59:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Message-ID: <vexqghyxtf5ntmu5mpijgql7atlzhci5fhde2j7gyrw4f2tpdn@pm2qzwtefmrv>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-6-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-6-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tJaWa7PWEtX6hjYfBbXMdB-IWPuYdeW2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX+T4/EIVGaSdy
 Jw6kIK2csRc/SkalH+TuJex3hoHTHp7ciQ2Y/wAxhB4c49fN+ggumv5poDskuWtiWdCnWJ/OmkI
 eTRqCzlVd/7YNKSDjb0/wbVFOq6r+iI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX+wQg+bdFxct8
 qbPPuWoH8Ix80CK8QIjTLYtMZubvxWRnKPfmKnrI2QiMTqVxaBC9ZopMAOeY5pB/ndrWN2MRDYZ
 Xe47pGzEP1ZCCDY6UJgCkFbqBYSdMRNx+Lj/DpLkGXFYu0R6/WAZ5slZIjZozwiEi+xHTQDwKQ/
 9Nhs+zVSc4KDyb7c/dFONyjsYv/5LmqbV/tNGY++RS45GGy42Xv7ol4w9Dwg1XO0sJKAb94aASW
 d1WdsmzF4Mn4AmnfVuYvjBjFLyWLu/OA+jfd6RWVscaujXlDPG9W5x3z71YR/4KYyWEGWCSwLwW
 KZIhX3Jo5sKu5qda14eGRMCXaY3Q5A/Pv01Bndhl2LcdX0QkmopOWOpLxCu/9FeXQW7csyrb83d
 aD/lhwKe6youkzDVag8xd6wwmTGfRIoGehEvS4L/MXiqVzIpo+DZkGHJfL/r3c+O+Q/bUp8LgF7
 QexWlj7tsavF4fakiWQ==
X-Proofpoint-GUID: tJaWa7PWEtX6hjYfBbXMdB-IWPuYdeW2
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a73ed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IkUaqJR2pzUdpQOAnGkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110005

On Sun, Aug 09, 2026 at 12:57:05PM +0530, Hardeep Sharma wrote:
> Add the Devicetree bindings and node-ID definitions for the RPMh-based
> Network-on-Chip interconnect providers on the Qualcomm Kuno SoC,
> enabling DT validation and interconnect bandwidth voting.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 72 +++++++++++++++++
>  include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
>  2 files changed, 161 insertions(+)

Are there no clocks requires for QoS?

-- 
With best wishes
Dmitry
