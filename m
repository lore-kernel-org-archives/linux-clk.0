Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702183E1723
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704251; cv=none; b=UgJXxwqmknWWZeLSbC7qWJWX7e6bm7QQCpkaQevtBqTZE/TP50jIrrHcVHGgKiuOa+f4QIJCDK8ITYZibtyifsQ5lQEdYHv3tTRjASkdqkERZhm7NCtVOZZs4Ojj2f2+ZGcQAGv7vabVIUmM57/IJxk929sIHV2bVqHhy5ZxSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704251; c=relaxed/simple;
	bh=4JOk2Hi8g7gu1SpQ/dGzbw1/zf+MVi4St5Xw4UG5IUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEdowl95Fmq72wrEj4P/QugoIflKv+So7Vqn//m0Ff+DvAyg6R5OafzooR//Goq3z1RCXhhThqhIO+lyzSLxwjVmI97nITAkzn4Jb+CMNgngiF91H9DZ62YomjKiJXzP7aaEHf55Eitv1C5DrY3rPS5gKPlCwwHHKldPXA2hdG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHV+qfzM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHV+qfzM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484374f54d0so1452930f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704243; x=1789309043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oY2AlOIEvJzDvrLKGXM3wmsBcdbDubrfZ+V9KSGxD4=;
        b=rHV+qfzM6Ex5+/1YtzNlXy84KOhH83kAxwgYicso5cwsacUJ2CJIpbGVKjSQ+sGakE
         3jEuEKeGSyUP2nlxg0xzrN0nW2kp+1aqADj5vPN52MmRinSOUn8Eu5QDpyoaJ5K/7qTE
         rcdwg1j+rXJ+OEnK/ZnNjQpqjQo+yk6+zaKZSwtsFhdgAWWz04nuS0C8E8Fv6u/Zkhhw
         1jKtivWHGR36eLkmn7PnvxvsmLdmT3yjpVOpSHo+FrB9UmvzQ1yCDELVDYjQb3+k/xkW
         JqG8+suf0zzF3UUCONpiFrW3wLqT10sNNI8NeNzOM8opwbMYhKpPA4Gw9eKpoFWcY8uB
         Wzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704243; x=1789309043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oY2AlOIEvJzDvrLKGXM3wmsBcdbDubrfZ+V9KSGxD4=;
        b=rVv6pAWCQ9rIhoZsYT/Ily/Ty7b9l/XX8Rjr9/N6rMIvO4yWqHHm253YNSOqbfN2JE
         FGh+dp4PJA/ymWbpnztaFZDByI54GDCr9Vclf0fO5ghN6ryv+ZK7XWgMISK4F4vXZmwz
         gYVQCnKIJt31f825fXAFrjGnerBeOlIFPqVaeUcKYccAErEmhCrKrCE5YluEgfgEZZD8
         xHKEIil3ifUKbviZoqg8XJSRfzI8HEJ2Ht8avHBxdiMUIxmGqhBD+3MgLntCgnaQN8xK
         0kC7EnugT0OP/qrl74T9rPbAwvf5SkYtsjchAxv2wtByAJvzrWzLWETFidDmA4j2aoN1
         dlRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyxg0vPCJN6IvcvOAFBte57OHk/vKW4IDsMnW0X+epzS9opWX7GnaA0vzbH0nJzkm4/WxzY4Yq764=@vger.kernel.org
X-Gm-Message-State: AFuF++lQn+mKK4HBVQOfd6qE+L+HWkfrSCE6oTs7NqNO98XUOgoPnY3b
	jbCSGyrCX2CcNwa5bhmr3u5VW+YwhDNuqhTBLYc4v0GvmStKhe8bD8ol/ERoyOuHdNY=
X-Gm-Gg: AYBFou1Ophhh2+5KxowjXnu8S5mUL5jkMzeta17SqXlWSEXrrdUgHK3OedUcvxEoMo7
	QQOtx5Hpj45SVCCJ6i5FBP6ccfSlWBnT7m3r+96RS21y5BUBjJDybhoSRtAE6ih1PyE7GFYkQ4J
	Ud3dW6LqykcJXgNZf0dBHu5Tkp3GmOUA0nrwyr9xtNAgTx5Sbl3dMnFnK96bDIWqiywhLEniESI
	6ffbly4FhBtFfYXU+NscLplFErYZf/vYkIMlrDxDkKf2IR2xThinUrDHw3eFx15ulGedty7sB+B
	EJCbSBeXwaqr787KWr4lltTjMme79EYKfNPzyH3AMn0dYRb52DCLToWr7tF/jaSGDhb6Lr6LoPB
	+Y3ua4I61tFs2vzIWxSe0t5Jukv+c657qItN+uuATJ8EAznLXnxGER/7DrgnM2INdnDz0A37ndn
	1aSdNjFaJfYfENDU989m3qxE68kfen3gNOjfTk/AUDcKFXR8GIaSttRIoBFY5/X7JYOLTsvkHa
X-Received: by 2002:a5d:5f89:0:b0:485:892b:bdad with SMTP id ffacd0b85a97d-485892bbf0bmr30611491f8f.12.1788704242631;
        Sun, 06 Sep 2026 07:17:22 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm21669763f8f.7.2026.09.06.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:17:22 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:17:09 +0100
Subject: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=4JOk2Hi8g7gu1SpQ/dGzbw1/zf+MVi4St5Xw4UG5IUU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXXoH9VPldgdu7R1ntY6a2BIdl8cjC5uvSJAI
 TLXjIFNoaiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap116AAKCRAicTuzoY3I
 Otm0EAChJV802lFTATmtLqqDUMwtkzn6JIwJNVtgDDOK6aREDhOVcmip3ZYh8bAF5d1WuSfSHbe
 Dsrg4ph3lA4WWiMTOAaoo/MImXhCT6Uyd993lwMpk8nyupZexMkgACQgmoc1iNebBfnahDQp5zf
 AGhQpMY4ogelQd4ixACVio6KgYDPCiJdClpzJrMnEpN84s5+30REkkctniPbn4M9aNV4MLq3gNF
 hFVgL93xKjNLo3x6yt+D8/ipcjfVDq0SkNkmLoapn7qSb1pLABmaIh/vcTVyEqOIY1/+evNIYpe
 uXeZjoJ1n1UWRHLC1CchbcSkAMZV4donLKx99QudDtM6StHoKruvQWr9cD7VbJiIvhSIKwAzQXD
 OhTEAIR36NZG2baw1cFdu5GoxNek+gxs/qI24KtrUfOxw3JL93WDXoUtThv8orngxZnIL7Stpbg
 YrLqt+FE56bj7rhj/PaXY+h0uSDq0XzJEben2E6imV1xwlUsyAMXEpiq+aTCDlXkg8KKURrRANA
 aHm/p8AoSU73O+yeDgVrlOHTwzwSjr4Y5JRE7aJobvo/sv7inVbqdhuECuIlTCx8XA2zjVXtJS/
 k+4SRthkoflOkR6zobNdiKLhIGC1de4brCoLaSPKYrQtkkQ9iK4MBTOsYHOI2kfDS7TD0CmyalK
 DVgZujw13DcEUlQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Introducing a dedicated CSIPHY driver community feedback was both to move
to data-lanes starting at index 1 on the PHY side and also to match that
indexing scheme in the CSI decoder - CSID.

CSID consumes the data-lanes property to determine which CSID lanes to
switch on. For indexes starting at 1 we need to amend the logic somewhere.
The PHY side code normalises the input data to register level meanings so,
replicate that logic on the CSID side.

Introduce a simple flag to differentiate between legacy indexing @ 0 and
new indexing @ 1.

Existing bindings are not affected.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 84097d82d99c9..07b3cddca5840 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  */
 static int camss_parse_endpoint_node(struct device *dev,
 				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+				     struct camss_async_subdev *csd,
+				     u8 lane_base)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {
-		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
+		u8 lane = mipi_csi2->data_lanes[i];
+
+		if (lane < lane_base || lane - lane_base >= lncfg->num_data) {
+			dev_err(dev, "invalid data-lane %u\n", lane);
+			return -EINVAL;
+		}
+
+		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
 		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
 	}
 
@@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
 	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	u8 lane_base = camss->legacy_phy ? 0 : 1;
 	int ret;
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
@@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
 			goto err_cleanup;
 		}
 
-		ret = camss_parse_endpoint_node(dev, ep, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
 		if (ret < 0)
 			goto err_cleanup;
 	}

-- 
2.55.0

