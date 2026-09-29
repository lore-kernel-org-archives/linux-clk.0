Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416A3AF650
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699579; cv=none; b=tFsBrY0PQwXZE3R6P0p/Z3zq8ayM/M8Iy4W4ZoMV/kTc5hxi60I95BhtWRi84RpohdKbizH4qXoRSVvwbNXTIpaUaC6p+5DEu8KCNxEo9Rrn+YLxCgWhiCKciota1eDQ8kGTmBDpeLt/Jvn4RMox3I6fptqH30j38ByzssInxJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699579; c=relaxed/simple;
	bh=lFCZmJXJ95RTTOtWoWX7ltmEVnrMePDVdpOTnlquqzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HYk1+e+N+FIvlo+CgRnfsdQjmtzzkKnc9ZdeU3szfAAfXWN1CLq9dYQAGDp5144XgmQ8vT3IlzqCCrJPIZFih82LXqDA4UsQalMq9uLXTxClagBS2Qj1Ywp19eLF9wEwvGgWUxwiqLGZGc2d/9BkbCA7WVxTKiibkaZZfJ6GpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gz/8etlC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYm4MQdF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gz/8etlC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYm4MQdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790699577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EP9aKTlXkHqpKd+LKABOdIxzdfpeBaYNQWJ1ZcxYfI=;
	b=Gz/8etlCpzRd1/bhDgEV6aZlCrTh0Mstdf9UTmH+gz4bvEMPqlVKOnNJFJ6Eu7E8Dv8kyP
	SG7ixrNhN0BxVkGTkK66o7E6gRVq2UVY06l/tE4WijeldI2tdHubVZ9PSXex6/HynT+Fii
	MdMEQi5ejLnnO6nO/H76H0s897IorZM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-dTCyTKymPTW7Z1Ux_5QAMw-1; Tue, 29 Sep 2026 12:32:55 -0400
X-MC-Unique: dTCyTKymPTW7Z1Ux_5QAMw-1
X-Mimecast-MFC-AGG-ID: dTCyTKymPTW7Z1Ux_5QAMw_1790699575
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91442ba2e46so72392056d6.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790699575; x=1791304375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EP9aKTlXkHqpKd+LKABOdIxzdfpeBaYNQWJ1ZcxYfI=;
        b=IYm4MQdFsjmvtmQzxBTl0L8oB4wU0kSj6RBXHdr/X9xBA120PiGy99EJ0Ly8viRAzl
         IUfkEGB2y5rcbRmyLQ8fpfeng6AUWO5YGtqkkB83yrf0CwHj/uLPvSWw+k8t54iktFIw
         ghHnnltVCQHEMLqJSQ4ovWARbyHt+uLP1LcwMsZhwS9vUmVO+l0Xrk8PvlY+T4ub3i/6
         reuIDClqsOLhiZphMUhg+ofuSCFJjGMj0n12aGtaNy57mQnwwiHrd0a3nMTz5Ri8jIv7
         Ff7vh8h3XGZQe+Q51TMtmOFzXCpr9pic50fHRqdwPDpan1HtnkukVN+ed6TE5+khqVo+
         hVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699575; x=1791304375;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EP9aKTlXkHqpKd+LKABOdIxzdfpeBaYNQWJ1ZcxYfI=;
        b=ftgANUolPWO+Tu51fnjeZQS5y64hjQGdAycCJmyt8VVzqtncI/bR7OCtcJZvFwwhIF
         HmvdaUEUptZtWd2VQGlDnELWOi8mFCndrAHWYXKZNNTe05DWh8W6ZORAaBpiLIezh/QS
         jFeBte3EA1JzASp/HTtF1CHLWHUAIuuxM7kiOcfy3PkSlMRm91yWYdKdW4qAI73Y9TX/
         AHfh1Tfm5+ObxtkBhbfXBp2QBksdTu577uGCVkMGqR9YWOMEN7N093HYvmBEzhN4VUL5
         ToHbIK5fXr9kzKUAa1ogc5Gbc9VkXtJ4NYJny223GsXSRmsA15SqTF0VH4/gHrKKxkQ4
         NrDw==
X-Gm-Message-State: AFuF++leYicp6rm25cHWhNXh0WJ/EJ2l/eVlxz9bUpu6rVZ5H6VFfxlo
	NyYh821lvCu+u3YjXgzzeIgK/vbWjgSCaE3nRsRoC5Evz/REU5CTHE8OhR+C71LMGiLcA4sLHsp
	IFGCCp1p9+h/Ra9gcabV2dONMjQCNrQcmZHMlecaEgcQS/cdbfUPD02R16ux+nA==
X-Gm-Gg: AYBFou3+BBv6IMhCIshwgYCt8StzkOe6nMdQhfKKvpYyu7nHGpnDpt04EdS3s1AtWH+
	WWysiAEfk52gtmzT/3e9R7795hhsrZVWFsZTJkmUWr+m5zqN7T1M7DznYdC0VJfaFD9Qb2H4+Oi
	z5Trb3nB8F3LSSHCHuxj9ocVGYlxBebb1IBrIZMD3xGBjfzvPpLGtNws9exVO1KvzpD2l0wcA3z
	cW/8ADF9sTimB/UVCnmwreQeXL7pfo3QSyOqjCkX8A/yk5pBRyX1BdN38OOw56uDUGcV9F5gFzA
	eTMixbClPyLIuU+LTkCZq72EuUKHueku/ZiySurKR0nPfRgZHFF3NIawXLi4PDEhfDwXPLmQB9C
	o0Jjj00eu7mlKyUMaTG+BEGSWzZcjXis0nNiyrYezJu/p0ZznbfA=
X-Received: by 2002:a05:6214:19c9:b0:912:517b:7bcd with SMTP id 6a1803df08f44-9142f9c5065mr274823876d6.44.1790699575315;
        Tue, 29 Sep 2026 09:32:55 -0700 (PDT)
X-Received: by 2002:a05:6214:19c9:b0:912:517b:7bcd with SMTP id 6a1803df08f44-9142f9c5065mr274823326d6.44.1790699574678;
        Tue, 29 Sep 2026 09:32:54 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d303590sm13921586d6.17.2026.09.29.09.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:32:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, phucduc.bui@gmail.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260724074603.28731-1-phucduc.bui@gmail.com>
References: <20260724074603.28731-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] clk: versaclock5: restore cache_only on
 regcache_sync() failure in resume
Message-Id: <179069956807.199845.7176756163346289190.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:32:48 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=359; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bx6Ay08Z3QW0ef7Ln4icY9WIwx4U+10IZuZxuaLdFYw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2vzDx3NXPvrDm9Mnb3i6Mf6ep+YRGRtaE1V0Ok2rWz
 b8g0uTSUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQ01jL8lVsRueBxsMRMm1VT
 rk88rqS6W3zh/+qWDRbd8293qd5+H8nIcFPpacEcdVbR0xbndJqb+9r1877437fNjOi7O9/i1eV
 MJgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 24 Jul 2026 14:46:03 +0700, phucduc.bui@gmail.com wrote:
> clk: versaclock5: restore cache_only on regcache_sync() failure in resume

Applied, thanks!

[1/1] clk: versaclock5: restore cache_only on regcache_sync() failure in resume
      commit: 7b283b8ce37d40d22f41bdc20b407cd76fe86e68

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

