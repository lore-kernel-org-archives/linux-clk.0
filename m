Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0231690D
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609372; cv=none; b=tifThccPSLKO8dUBMgUi0x8op91Clm8VCJPtEAUyicoxsL5W3Ln2qLLhipeBkIkN79ns5z+A5rpUmJi7tVlgfjgq9E3303d3km9Rju8ttBHoa2+doWzoJ54ow8Zo6g1ComveO5DOBM0LCEcnku2AohTb4ATmN0FaAm/4PLdIIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609372; c=relaxed/simple;
	bh=xqwpNMooTaIdz0y9JUPSbiJ3oxZWuqvmNdg4pIHMQ5k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gbo+7X0FNVx85rYgJ+vVOm19uerrtVxoYTIngW2n8t+o4yZ9ntvx/niK/QdIXmf64cVOSjSkkYWwiEJyAUTLo+N7U0Ea1e/RvRKBNNto745p2hTrf0R32Ii72k6DloB4voOotTd3e64QKETGTYNWAzwGRjaEQjMTdwIRDqdiT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org; spf=pass smtp.mailfrom=jookia.org; dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b=Dj9YJTP/; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jookia.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b="Dj9YJTP/"
Date: Thu, 16 Oct 2025 21:09:07 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1760609365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=WFDiFA6zLRTJNmDhHzgOdS/hX+IMuTwozMzz+W1ATuM=;
	b=Dj9YJTP/8kUovw1bdC/cz45wh5i4b6kjqVOIKDZkaR+oKPbwS3G3L9oaYTSNi4ZdDSteKT
	UcIR0osfydVPWkpiCSBznuT3UAkOQPQrr0zRMd+9m+PaHF8iqF9xRgUs6nUuZ0xPmPxseJ
	jx1ozPj8JvAqspHq+Zd5SP3WjhUhlZO7kMmkbTArkeu3940AuAkgn0f70g8NY4moVKyglH
	vuuSSAPWXNxSrqctqM8Iab/+0vZQzhbkjQ5czmAA1FxZQBfJxVfv+TPjk3UJ1jsJSkUnYT
	k2BRqftb27uS3Wj4RxDeqsHfcQ8viaYKn2uFgO6mHp5VRsRnStU24p7AmIpt3g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: linux-clk@vger.kernel.org
Subject: 32-bit clocks can't round above 2**31
Message-ID: <aPDEQy7M71ZKqn-W@titan>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

Hi, just a small bug I spotted when debugging some code. Hope this helps.

--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1572,7 +1572,7 @@ late_initcall_sync(clk_disable_unused);
 static int clk_core_determine_round_nolock(struct clk_core *core,
                                           struct clk_rate_request *req)
 {
-       long rate;
+       unsigned long rate;
 
        lockdep_assert_held(&prepare_lock);

