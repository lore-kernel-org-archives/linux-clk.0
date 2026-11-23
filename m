Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461679;
	b=dlqCxa06qaILy5KWzRriC2hCVuagD/BgBz+zhEb1uqpJEWC/+CPrBZk3Vl6UQqpcXaiW
	 UPPF6pO1PXxoyAJFB3RV/3fLquniw4y/+L0Dnq+o12hxTSzth2j2AVoHn4nDyq+wiN6bD
	 vnrNZPJk5H3t/Q3AberU1xTF6uq1p5bWvq6ZUcwZSU9V3Ngp3hzg/5EkBiy2w7Uh5fQIv
	 TrVHuzTB1240Kr7AlEXgFRdGG9ZO9JEhpYAIl8BqIgv16GGg5ePtzrKMzjQ/lytK/TFSX
	 5BrWwJBoy4TA83UOKSykx8H2bl3xvn70iZndXbeRuxZCPtX0HDPjYGqbWMesgwCNIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461679;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YenVzUENeyAkfY+Ukcti9f5MSKqLTG55sZyF8s5Xbrw=;
	b=OCd71QX8y+U+i1uRE6gtGwvUDjQcg9OcvngENdEV+9e1p7oeCnqOFbhzOWkuhj+rd7We
	 ZR37GOPB3SygZCc70X0azNK17LWy6KnFuBp3qIxRS4nk2mCgMdtNv6u1CvSOwhYyzJ+xa
	 EgYEAjfK6oFzzkLKc4zY4wEEEYxOFHEDYYp2VYtuWGNe9yYNVKpC1ETOH6j56oEkAbcH/
	 N3fj4VKrya/MfqOjn5mcXAgLOLPa5eRik5e8x4oGPXLDRi2WR4bz/TwzFCrI41csFGVQ7
	 DcwE4Aie6MOClmBh/Pn1U2jOhe3XYRGaxMZY0vYYX41mqm0+Il70Dx0Gkto4tP4OMiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKFMA2Ns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFSQeXN4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89AE606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKFMA2Ns;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFSQeXN4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH2NT3475181
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YenVzUENeyAkfY+Ukcti9f5M
	SKqLTG55sZyF8s5Xbrw=; b=JKFMA2NsBIRsXVn++Wc/mZ/AIOPqgZO3jSdYvAIA
	25w8PSC6iBkjYpz77hpafuNsdduwQKxFTRRT5CROSY9WvxGBunoTAuKzaFeqyUK4
	Gl3b14Umc9qWeHHOj6075ehq4Zu6T6VeYKSYs8SgEr7EtA4M3cRu9d1HMX3IO5Fd
	R4sdQ85YOvkbLTSLZURSBBSuzK81Et+7YjaqL23xsGuyaYfDO1m86ccrAHxdNYc9
	kKwXARFdlfCAytmv3ewuxi9c1QhsDCMpiTjWXPGXPVMi3zh5R1HzN9K+WshPzI/R
	y4D5B8EmGmxdVEmbAXiZ2wuI8z5Ye6o2bSHEFk3QL7rowQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tr64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:21:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so889218585a.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461677; x=1796066477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YenVzUENeyAkfY+Ukcti9f5MSKqLTG55sZyF8s5Xbrw=;
        b=eFSQeXN4giAiqbv1hEDTfGd+xXbcZlESBdeRlQAIwDMqrWOEX54/jrj1FWrS/+et2R
         hy1WdEKGp0oMdX7FR6tM1Bxt9hyL7uYGjR5i2NiEQMe8IBK9Iah0lRDZFJR0Ei78XdXM
         +fmVVhsYR05MvLSwO42Uh6y+43aCzXW50vudH59hVjmQWgkPpjYO4pymtXWczigWoGse
         oXU8a7zyXB1EkUflA5OyGtZ3gXBHow+sR3s+oG/jtNEY5Mznld8SSeEHdGf7G/8pZiFd
         7f53iqvW8o4btCMboQIR9ToTuabPaWLURinYd6ihi8uP/1KiFgjPRBnQJgsrQkalvh7O
         /KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461677; x=1796066477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YenVzUENeyAkfY+Ukcti9f5MSKqLTG55sZyF8s5Xbrw=;
        b=fgg3fb6P0FmWccwKF7SSmFq1vkTTUTR9xUH+FoQ/2DBH6MqyUHCSCa0AMW0q4YzhpE
         ABI542uB0raxtXHIUx7nW7HRWywSDDclXMKQlAv0eP38zXiHcnQCQrppOBx+AUI2jdKb
         xh3EZhSvcqad1Tc0aC1Qnh287aGwItML/JQCfTxtnNIZ99hRZkHk7SxBGq8W1rHLXLYI
         o4jtY2e1B8pWcQzabuAKzQS93CpCY+oGEGg3TOIVcDiV/GwhNKSsDAAsK4eHOj6qyH7W
         2Hf8ajrzLHbFNrke+WzxIS7bsiCDDCd5S1Ip6/EFMnnazjGhXGhjqi9uknJULjyFOXe9
         bE3A==
X-Forwarded-Encrypted: i=1; AL+hErEDv2QEUpyMegtI86pvrC7HI2YRHcN863PEy9wICVBXFQQmHmqVgiJmDSJ/MnOyGzn53AwEn57dL8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WRefhsgXdWYlaKsGwJsdhWKZlyslgIhMhjj9R7lKix3ARwNuk
	+w06DRwqpIAkPYjFeZ+4InGHiUEQOcDkquVz3fvhJ5DwnKXeLW2ElY+Tc8dLRLUBPrxlSH2gAjI
	CXwvjo9hc0OdHDENYa7WmIiqo4C1oVh+QNGNMHYcvZpZUWX6/vAdfJ4lNNU6l8C4=
X-Gm-Gg: AZFdTZd7dqLu1gTpYwHpjqIUBk4qHZYYrX7RYspmc/X7mDqLHY005NS8Tx1eYpW+yHN
	LA1NV8JUNfCP/WXFO7qBQ8pX+sLs8E8pRr6Hu+QsAevV1gNeyCA2ycBfVvsJC4sdtLIqQDioCIr
	VRvlYyAL+/CXp3U8TFcZvPccl5idNvv9H5oxgimZRVOIGivWJVxx3quq41N38POc1t+NIcnWlTL
	kpR39jgZ1LJSy+Sl2tpmGN7z+QAtlfrkwcaxCE8BUwidYTM8C8TGcHN0p7Axr3q9uTsn4QhQEoC
	YS2+Sj6B9tOte8s1tBu18VaxeSLPSywIw06EuDUJMfMn/UILdwiov2timxLAjWLda/CfGK+ifk4
	fAHZbKoSzOOv3kvcsWjv4Vq91QbY1RYuhpqugONqtARvv3qy90mHLg+banLe5th0+
X-Received: by 2002:a05:620a:1d0c:b0:93f:26f6:6bab with SMTP id af79cd13be357-949ba99b09dmr1953016585a.18.1795461676743;
        Mon, 23 Nov 2026 11:21:16 -0800 (PST)
X-Received: by 2002:a05:620a:1d0c:b0:93f:26f6:6bab with SMTP id af79cd13be357-949ba99b09dmr1953011285a.18.1795461676029;
        Mon, 23 Nov 2026 11:21:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm23371864f8f.36.2026.11.23.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:21:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:21:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: Consistently enable MSM8939, MDM9615,
 SAR2130P and SDX65
Message-ID: <4zmv32wcrtblitogslaxlr7cc4u3hmhovckbce3o7pbjm72i4d@z2aelpj2wihm>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04922d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7p0CJgGdnewSgPJmmb8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXxIVy3v2+wqSx
 vn+XBwTvTKxajr151gG8ZiUN7dJ+iGZfgilXZdT10F7o9HLn/BS8dUDmhsm91/A6d+rO78Vz9rq
 hz1G4gzWEW24ABWK6xRjBq74ieD9ZxgG7Rm3LU15ZrKcjqWjXI+4aMvn5PFA6u4sATnHmy3dXc2
 cgaA8Tnb8j3HVcEcJSG8taLRDgNnO1yfNia5mL31Iwd4CndNHZ7MZsKm2Yy8CiFy8JXMWtM240n
 hwFqVLG1x4ZTR1p+GUMHjS36IYHLGWfGeWNMJXilrZBQ8S73ZoGf+w1bkVthosmH2kcf5nRYbzS
 QdpEJUBNw0QSMkMli+k7SXBengM58sr58zUVNyqcpOsu60Mhkgk7c7hiVLvwdyPE/I/6we8S1zb
 EC9/34aeOWQOCJHdNwhbNtaim3gWmLgiKtwDI1cNJEwCfZ9GLr+p8tcPR/WM7b8A8D7ZrgTpsWs
 qwMyQi6LzR/r/sV1mpQ==
X-Proofpoint-GUID: lb9y1mqGFBAinF-RG5MFcS7tHoUf0JW7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX4Cj6KWTpzrs+
 MCQEkw+eluHjtUj7M/Kv4fymL3USIjbziMYrU6Oz9kdDkLug8kinKgggCKI03+E2OPA5gbL4rt2
 wmEqt8YQWK78aMa3kXR4JtcHmLiT5xg=
X-Proofpoint-ORIG-GUID: lb9y1mqGFBAinF-RG5MFcS7tHoUf0JW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 26-11-23 08:38:12, Krzysztof Kozlowski wrote:
> Critical drivers for MSM8939, MDM9615, SAR2130P and SDX65, like pin
> controller and interconnect, are already enabled by default, so should
> be the clock controller drivers as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
