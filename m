Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6BF5372E7
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075167; cv=none; b=R9sEucMY1W2fMKco+YzMSrGDCYT4MvT+2LjgUU0DdM+stXZ1HhPsDX7xs8NLpRH1Nh6NBAfwyLO8CojKzZ3RQyEBiIvD6TIMlYZeAJCWORdyq7Azizcyet6a9CwFS8zTxW9erDIzJH9iLOiEq+9EtH5AhmOo/x3+/q7nZVmPlcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075167; c=relaxed/simple;
	bh=s/0O22UlvHKYSxa61UAVvdf6eqtjzPHamDIakwAoE5Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nunx5/UNQ6m9jnIvlVAzxXbam+iqzsgRbpKZm8r4IL05YZXYu00jpez+0xh/vzgJFcPBNeZGzDLoC1p5VhZSu9zbORjY4etM6BUOiGIYfIKr4z4wvCVHUFWeWQqkLHYD1pj6mABH1Kpk62l1MwekAZFL5Wv66Sw9cZnp+XUs2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WY1rGbem; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WY1rGbem"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6995994a91.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790075166; x=1790679966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ecy7FzIPrtxUNn+PNMjV2l4GmOvdXqqQHutFCvXsJQ=;
        b=WY1rGbemVvteaE/3BhtWu7EVmN6LDsMw5vRyPU7xONN3QZ5w8FMRRxjeFENfk1/SmU
         +aohFLMK/p2Lxb12GX4Q+NW2WbigXoTGWR9Ym6cJkdJdW63TQc7rXfaCB9tZ+7cKAeBd
         MEQePu65OtnWFP6v43/hrE61BrjVJsWb7sTXkX0jmJgMInkCaMwnmtYg6yCNaB8TTFnn
         e/PTbzQhFYZECylMksKtctUb0prjO8bIh0jVKG/VvpXz/amGB6NqI8FxQH66cg1jBeuj
         mqxG0InWzb9DtL7PLB+SAP+4a1KBgdIK6E09L/4yoPilX7alN6qAsF4aj+XO9qqwO8Hz
         Qvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075166; x=1790679966;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ecy7FzIPrtxUNn+PNMjV2l4GmOvdXqqQHutFCvXsJQ=;
        b=d87SrcZ+QROTo4gelaAHfEb69h31x3fE9nw/RWm7kLbQhwlxrSMRbS0bp9AHCZhwso
         Jj+2jN7Dfvb209qKLVWomOFdUqNyhkVvkvgfV2GV8QU9gtHTIEJSvPdKODoEcNRskJrm
         J0sDf+soD73Q7h9ljYGone/Mjn7HcqFjln++4BAFqGimqk21waPapujSgXGSJe3Iz34E
         mX0w1LVqsc+kxJiPFwc5D6tCUuFmRDqHql/5uYAAEc+5lPR7yYhRZf8gwXzq+ZwXUl3T
         fKddJpxPW3MSpYh1yhP4cpJvQpSz6zdfV++mlKukSkziCMVshThWAZAIl+wXB8ziLc3A
         CDlw==
X-Forwarded-Encrypted: i=1; AKwUvBxY5wOu1o1zzFanDsMeEDJQ6JRUP2OHHAlrNv1Ux/POrmTj0b1zW8lBB6G7nDRH5v6EEr4dIypsuX0=@vger.kernel.org
X-Gm-Message-State: AFuF++k+ljg5NLVju0EzBLuerHabRQnNPVrazyGMD4QWtwTzMXIY8Fro
	qLz6NAec08rbBA6xmQjDUjQFAAp67r/Fw3jsY6IU6bPNotSIiZB+FVERZuhdNO2aHgYGJnftSkY
	d
X-Received: from plw15.prod.google.com ([2002:a17:903:45cf:b0:2dd:b2b9:91a7])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:984:b0:2d9:438e:b70d
 with SMTP id d9443c01a7336-2df609b194dmr9585075ad.1.1790075165400; Tue, 22
 Sep 2026 04:06:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:06:01 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922110601.1959213-1-morbo@google.com>
Subject: [PATCH] clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Annotate the "configs" pointer field of "struct
tegra210_clk_emc_provider" with the "__counted_by_ptr" attribute,
allowing the compiler to perform runtime bounds checking on accesses to
"configs" based on the value of "num_configs".

The "emc->provider.configs = devm_kcalloc(...)" call uses
"emc->num_timings" for the number of elements, which is then assigned to
"emc->provider.num_configs" before any accesses to "configs". The
"num_configs" field isn't modified after assignment.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/clk/tegra.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 3650e926e93f..f1034e14c1a4 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -170,7 +170,7 @@ struct tegra210_clk_emc_provider {
 	struct module *owner;
 	struct device *dev;
 
-	struct tegra210_clk_emc_config *configs;
+	struct tegra210_clk_emc_config *configs __counted_by_ptr(num_configs);
 	unsigned int num_configs;
 
 	int (*set_rate)(struct device *dev,
-- 
2.55.0.1082.g2b9226bbc0-goog

