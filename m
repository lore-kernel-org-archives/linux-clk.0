Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591483B634E;
	Thu, 26 Mar 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513252; cv=none; b=BdfogJfeerdUpvuBuCAtUbihmW/dEzbrVRlP9yEVOAZl1aTJrCW9SA3YcqMPNNRs9vA/qDNM1WnOH+wJonWxXLRteyKnTDF1xb8s061vH4pUunh9hU3ohg30NupjW9+TvbycavohbiZNAIwaohO7Xf5ExKy/yZDD++XkdCCPOfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513252; c=relaxed/simple;
	bh=e9ICveQKvF/Pj981F4inXuWs6rjFz4ZRDL/My9t4tn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogOMyzj2rMfr2YfaKN6leNxgKMlzItWFmGARIBjCWHn7AQTHq9S3mwQrNrkSH9ZW09E39dZkeQElw7tMPJoCwGFy4Ucup5oLKe3575OSKQhLqFDtUh2pa4y5RT/u6rEDvsUODhM30tHfhhUj0NLqC5NeW2qwH6Wn3Wgf/Wzy6T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=COHSkH7u; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="COHSkH7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513246;
	bh=s2oQFoR0c+QLUYmpARQQP1qguleDXuKVE28NtoCcXFM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=COHSkH7u/KObqDhSaCO1Qxd+mFQhpadV9YyOrTbyX7+lgTTgneQRWiHbZeKrJ1uCy
	 tYXsc/AXcIZmTTi20SGb7XgfpSGI6NHhgvF5nttT9gsWuOJZdZW7BxhM7aPk4QhIhL
	 EPdUsWhZCNsN8nVtu5U8m7QVHKBEX7evDtw4KBAI=
X-QQ-mid: esmtpgz13t1774513086t91d86235
X-QQ-Originating-IP: WElT2ry7tB8lLshZYv4GJO/uXGJxUAxREOVWudDvM1E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5813357295309933169
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:17 +0800
Subject: [PATCH v2 2/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-k3-pdma-v2-2-ca94ca7bb595@linux.spacemit.com>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
In-Reply-To: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=782;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=vS8ZACtafXuUdon1LCamqQGUmKVZBsmItTUIR/tecmg=;
 b=rZ789pdyPNreWYgyYMj3Ulx6Thkc9cK9AJwqZ8/NSDypf/6iqa3XNSMQxqi/NgvKGq3oXLt6I
 u3K7i7aX6DZARoYYvklMbYEx7O6n6Cu+BVZwc5vgZAMd6pwl3BrABPm
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NSukcgWmJNd8Ai4F6tcvPfjoTiiqNc3hD3b1TNOC2iEKi90cIl0LADDA
	uUjd902bBAV2l3eN36VPIy6Vn+7Pki11LREBUIk60QlpThI+ONW2hW0m7Ifl/XpkZPjX7f4
	IL4EPd34VTI5C9/c+BnBOLFK0pgs5y/jkr0+vENdIjLFRCs9Anjb2LPKKrnkPDf8LoESz7Z
	JvlhOcQ6kDcHp2hu7Vx4sawVXrmscDfkd1OLTZEovkovwJkWDjmUlrX7+IN3ZHrmQOgC5Rj
	D0YqeyueXPeJWxxknw3e2hqmP2G4IiQxW+6LgrIbCrwtfuzLLLqDQbZt9KQjaPEhf2qHCCC
	SSF/5kpHg3b7UJamG+VlfK0AHNSfldnrJDkQHytQQPT8zJI35HLZN53Yl7y1xHhyifORheo
	d+PUhoyAZnpnHJASro4pjtLBF2ZCts63F59L+edpkV/BaGTZ70zc8aSi1Q0udEhtUCRwbWF
	2QVgr6mcuFySxJww2LzBOwBn8Fai64p0FJqoPfV+3mrznWbpZlR6RnGzIcK44K8NgAnOdIl
	T7jNpBpIuW5mfBKdlwI2LkQ1xKJUz5m2JTGtMk1QKgSIlTAnQh3K+gB1CDt15owHmPn6DRe
	4xQkpLJ88+fERwHbNFll58wk3akFOSLgHPCP/+GFSCuldz+ncjaU0FSONGMFKrrNv7S739s
	JdvSBAS45PhgzJGdxAD+2oz+10oLGdsPxncsxHTS+hbJIOYNey6liwPQzsRgkpwyOrsh0nS
	OkmIqUBhKEyNdAuRv6Qi/CL5uSSeMFHrRosadGOVsyFince3qDdOMLVQSzO2Jn1Sc8r19on
	uW+1919ZonB+AMfdaJI8udnvbCTithYytXk1xh2YrLiJLTNLXuDqCGtBIT/uyhuFydryOEZ
	gKqvWCmwzbMB3zyz3d4SYzpPv6ICwrkKiv/uLiCCg2pYhIEvIOzaoR4sB1W+1FPmNF0kATv
	AgY189IkuLMX0Xlngmway8ncJHYfqvh9Z3akH471kFR/HM6vMgnMgFOkO0OiW8Mufa7QGeS
	P0GEhGY0eIM8GsWW3G8fTiiHro973jCHGXhUpdy0YCaF4d2cd3X0uNALlr2y3DRHZIsic9A
	JHJMwfkN5EHUzJvgMQxCOs=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Guodong Xu <guodong@riscstar.com>

Add k3 compatible string.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
index ec06235baf5c..62ce6d81526b 100644
--- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-pdma
+    enum:
+      - spacemit,k1-pdma
+      - spacemit,k3-pdma
 
   reg:
     maxItems: 1

-- 
2.53.0

