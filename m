Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81251514F8
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687747; cv=none; b=Jn+WsLBVPw3e+VEeFUDwVwzrw3g2WEeEtC3NiIgCTR8fISNu/v/v6/yy+DtTumO53BZXcDM5I5aBpsLeO+Rn9COP6wh35JoQYu6ouJSGpye9Sl9AcKHYi+sKfxFXdP0t6lWbqk4uolUu1OFsm45/p0RaBa3dtbilxizbq87sJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687747; c=relaxed/simple;
	bh=Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCeP6L4trwlaSlDPWZuK98udkTOz4egCBxdoaZUP4mUH1RKW2vWJeb6C2wsZblQ+ReT1EY6iZ2ZRmJ+YNj/zFSfZ0qPDl1xGn2cpIGMsfF5crL6EiI1YjHb+prmwTIKzznUmOTT2AEWDH2gTSBAa3lGK3sOvINFbp2+Zrx+q9Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRSy3nJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRSy3nJ4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK792d0024251
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=; b=LRSy3nJ47eVv1x/r
	RYcMFHq4QDGUTLr91PB1Tcx3UhnVVQhxqaLKe6bKqNPkQC7zSaiVo9njvksGR3PV
	Ec9SYzXUZZdG96+N5E6l6hrMTpC107YsVG220PXuPtxxvuNz77sCZlBMLq3cTwpB
	saQEH4ilPtHjz1fQ8WslLvjLeEI/fu0PA5l3XcAD5OWJkTbREtz9wWS73kFCjlh4
	kYXXAVyJ5wBNLGmXCVbxFyUKrMjev2dGIiFfvkwK9F5MdEaMqO06Vzjot/gZcGvo
	g5PSkuZazzLAZ+3cK5QnKLcAGCADdtUI/h8JSNXbXwLTaslaDB0yXr/zaD6Vxjyo
	ayRuOQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3xjre2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:42:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d88fe63f21so4161576d6.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 01:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687743; x=1735292543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=;
        b=IMNAtzvCl7f62x45doovhGqO9IwKAn/+0YMFF9MD/25S2ajtgsVAlEKP55q5XVzyFt
         VpUnKlTXVQLoKk2Z8MbrfAoWLkA62+5cq/27hSfCLHOc7C2ileagE/htb9Rc69voVdtW
         NMA+9NQPFdpaG3aiBhcn4yquvLgtlo1T2OwXXHQSYx40xQRQ7EFSiCNm31Ca49TGH1Q2
         10ZV4qQDs3z10bYYOhTGkwU+VENSTT98mbuUPVncp4D8EOlzPHkzjakQZCidP3Iv89TG
         FAX0WwA3uG+7wNYkjdTJlp5KLzs2sSLrNLAs8Cc94NIeN2KwGdqx9D5pifNDPNH4Aj0l
         dmBw==
X-Forwarded-Encrypted: i=1; AJvYcCX+s2I+1eOMqFvuoTEz9EWp4IQ86PrhK9k1Rgb4ZBpyGNPMMEA8lQSUXgZhMZfFKP0HmNpfcJJSW5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7WUZRqGECWaooOzb66d5N0LW3XNoeWZGjfFUOYO5hWroyDkH
	3R3a+H6HVgWLbMHkDHlm+Ntwlnrz5wYE/z484aI+sVx3QbrDqlZeiFAc+wN23JJDuiT8gHJpX+D
	RLGYPKsLR8Ho8UGSqjCScDrc08Vo77HA8XisZ7NmOhS5htYu64YGuIx0UOAo=
X-Gm-Gg: ASbGncuCqMI2gpXRqqou2LAq0xXYErGEMPtN1W1v5ETiTquBdvsxKyyeKZ/SaVLnRW7
	H+g+MZj9MeR4UMUcZ7+pwywH2aM3kjH4EMlsaarjbLngy3TsBWM/VCDRCkDJxWCTfLDJcMt+2yM
	gTDmD8OZfkvHLLz+nicyrdz0Gm0v5zeOom8XXdhJnwEv6BFDnhSjt3YU5vPnBPE+k32c1zGmgw0
	5EbThHI5BF0jik9iK4t4FxnA4qqhaqm7pP5kxvpq55pIRlI8KIF1XZhTMQJnIvzft1UcNHQ39aO
	mil7ZHpBGV7qRlTWFnH9u7rbvuDxpMIa9rc=
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr14370731cf.10.1734687743651;
        Fri, 20 Dec 2024 01:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtVFYoZr8OVyUkQYL9m/mvQSFGgdGO3w4czfWfr5Bk2uAOQJsU+lMK0vdweVrYuEj46G9JVA==
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr14370531cf.10.1734687743313;
        Fri, 20 Dec 2024 01:42:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a41esm1545415a12.1.2024.12.20.01.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:42:22 -0800 (PST)
Message-ID: <d9309db7-e208-4dbe-b408-e637566ece4c@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:42:20 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm6350: Add missing parent_map for
 a clock
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QNHWIYCX4jGWBS8A4nbWA6WnHl3Rr1Z5
X-Proofpoint-ORIG-GUID: QNHWIYCX4jGWBS8A4nbWA6WnHl3Rr1Z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=828 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 10:03 AM, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,
> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> like the following:

Same as patch 1

Konrad
