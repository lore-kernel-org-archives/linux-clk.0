Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932797;
	b=qd6QBGzszcLh267N6KgFmBy84dGVfYalOHfC0nVuCA0UJrDJt4ZhSVBi4iZMCYXLc8tl
	 V+KFyNS/LejtCY/T3g0S5K1MQeerpt1gLZjZFtotLPEj1vyC43CVQXb0tVwSXe1zQ4Hs2
	 EDV+py5+9RufpBCNG0/snxAO03dRSz7WLn0OUMpLBxXANXY7LxJWZNiCQGNRTsb5GVJiF
	 INUBP2vVLGMCTvI0aWYIL6IXl79Qq2bGfTmUh/H5Ab0wxRXAcfxI91BjxD6L1F+r+XdE+
	 nTsPuZ7ahXfh3Ju2gWDP+aAi7LuluFysFG209nMp9S3e0bDhGugRwrpmhkCMbWcV7Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932797;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=carvPggkXb52nq1kon8OUgYNoFEqAoo0OSAHcurKhgg=;
	b=DuS364543ZUVXPcVZcCDdwFfc88fpFYpSCHGVAlTtWIQAH/AFGbkOZEtJDfur3h2iox/
	 opkmhjOHUCIv8t77lEvPplhcfsom40g8tSi2PuNlqPHwLdBxZU/DDyWuyolOv2RTXx71R
	 rx022YI4UGCFeEkvFuzPAJkIFMy09xW1F7mBkkE9f8MpBnHpwb3/ntdgaA0DdBlmOxueg
	 N1w++E3xMV2kj5jGp/VTMqMJk6Z0Bzm6iU/KzXsLAm2Lh9J36OexycovcHdam+2XMBhh/
	 GIu/KH0DAIEQWh956k2hJIDXU2OdHuMVg3NTQ3jO0pBsHKA30GT+wQYl/uecacPseaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oF1Jj9TU;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D6606A326;
	Fri,  6 Nov 2026 02:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oF1Jj9TU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793932797; x=1825468797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9G+m15M8pgygjZiVmHGkqDC8/DoP+cHy6Aw+E24uXWg=;
  b=oF1Jj9TU2vLesj1whvWviBJ/Zz0oUpMWx2VqVSLie3OfXv/utHnmiscY
   WQTL4xGTn8E/BNLUA5fkZYf+WwgalgbpmRTA6RxKmwvMZLHGdZMDLMF4P
   PiEiohGdL0JXdSBY9BYx0G8z46Gm3StLtsPR0GObarX7xH8QUem9yBROF
   eoUXlsEANrV8TCgfKw6XX00/HljMRc0RWwVj1bHLE+VNj/QwA2QaiZjNj
   AgfXujsMIizzmEckW23ioluv+3SgdHi0h8Tgqbr4ePMhiPsnG1Daj9Wvu
   K2sndhNVUBfBjaXwAv9kKWCAB6H4o1db77lMQ2AkroJfA7w5wrXst2Ta7
   w==;
X-CSE-ConnectionGUID: NFbn1VmOQoiynYQveYe0mw==
X-CSE-MsgGUID: Tgh3l2NTSsarpCBB9nGggQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2642947"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2642947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 18:39:56 -0800
X-CSE-ConnectionGUID: KS9u3FBUTWWX+np6X1wz6Q==
X-CSE-MsgGUID: UVNMrYxjTwqQ+PgcFopzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7293755"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2026 18:39:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP9rn-00000000nCp-1GFE;
	Fri, 06 Nov 2026 02:39:47 +0000
Date: Fri, 6 Nov 2026 10:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Dahl <ada@thorsis.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Mihai Sain <mihai.sain@microchip.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: Re: [PATCH v4 05/16] clk: at91: Allow enabling main_rc_osc through DT
Message-ID: <202611061036.HmCbW9MI-lkp@intel.com>
References: <20261105110715.2486432-6-ada@thorsis.com>
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
In-Reply-To: <20261105110715.2486432-6-ada@thorsis.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Dahl/MAINTAINERS-Add-sam9-sama-to-AT91-SoC-support/20261105-120637
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261105110715.2486432-6-ada%40thorsis.com
patch subject: [PATCH v4 05/16] clk: at91: Allow enabling main_rc_osc through DT
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261106/202611061036.HmCbW9MI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 812626a41399a1d464a0d69627ab45c83b8ebfb9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061036.HmCbW9MI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061036.HmCbW9MI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/at91/sama7d65.c:1141:45: warning: variable 'hw' is uninitialized when used here [-Wuninitialized]
    1141 |         sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
         |                                                    ^~
   drivers/clk/at91/sama7d65.c:1106:19: note: initialize the variable 'hw' to silence this warning
    1106 |         struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
         |                          ^
         |                           = NULL
   1 warning generated.
--
>> drivers/clk/at91/sama7g5.c:1017:43: warning: variable 'hw' is uninitialized when used here [-Wuninitialized]
    1017 |         sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] = hw;
         |                                                  ^~
   drivers/clk/at91/sama7g5.c:982:19: note: initialize the variable 'hw' to silence this warning
     982 |         struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
         |                          ^
         |                           = NULL
   1 warning generated.


vim +/hw +1141 drivers/clk/at91/sama7d65.c

  1097	
  1098	static void __init sama7d65_pmc_setup(struct device_node *np)
  1099	{
  1100		const char *main_xtal_name = "main_xtal";
  1101		struct pmc_data *sama7d65_pmc;
  1102		const char *parent_names[11];
  1103		void **alloc_mem = NULL;
  1104		int alloc_mem_size = 0;
  1105		struct regmap *regmap;
  1106		struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
  1107		struct clk_hw *td_slck_hw, *md_slck_hw;
  1108		static struct clk_parent_data parent_data;
  1109		struct clk_hw *parent_hws[10];
  1110		bool bypass;
  1111		int i, j;
  1112	
  1113		td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
  1114		md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
  1115		main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
  1116	
  1117		if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
  1118			return;
  1119	
  1120		regmap = device_node_to_regmap(np);
  1121		if (IS_ERR(regmap))
  1122			return;
  1123	
  1124		sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
  1125						 nck(sama7d65_systemck),
  1126						 nck(sama7d65_periphck),
  1127						 nck(sama7d65_gck), 8);
  1128		if (!sama7d65_pmc)
  1129			return;
  1130	
  1131		alloc_mem = kmalloc(sizeof(void *) *
  1132				    (ARRAY_SIZE(sama7d65_mckx) + ARRAY_SIZE(sama7d65_gck)),
  1133				    GFP_KERNEL);
  1134		if (!alloc_mem)
  1135			goto err_free;
  1136	
  1137		main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
  1138							   50000000);
  1139		if (IS_ERR(main_rc_hw))
  1140			goto err_free;
> 1141		sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
  1142	
  1143		bypass = of_property_read_bool(np, "atmel,osc-bypass");
  1144	
  1145		parent_data.name = main_xtal_name;
  1146		parent_data.fw_name = main_xtal_name;
  1147		main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
  1148							 &parent_data, bypass);
  1149		if (IS_ERR(main_osc_hw))
  1150			goto err_free;
  1151	
  1152		parent_hws[0] = main_rc_hw;
  1153		parent_hws[1] = main_osc_hw;
  1154		hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
  1155		if (IS_ERR(hw))
  1156			goto err_free;
  1157	
  1158		sama7d65_pmc->chws[SAMA7D65_PMC_MAIN] = hw;
  1159	
  1160		for (i = 0; i < PLL_ID_MAX; i++) {
  1161			for (j = 0; j < PLL_COMPID_MAX; j++) {
  1162				struct clk_hw *parent_hw;
  1163	
  1164				if (!sama7d65_plls[i][j].n)
  1165					continue;
  1166	
  1167				switch (sama7d65_plls[i][j].t) {
  1168				case PLL_TYPE_FRAC:
  1169					switch (sama7d65_plls[i][j].p) {
  1170					case SAMA7D65_PLL_PARENT_MAINCK:
  1171						parent_hw = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
  1172						break;
  1173					case SAMA7D65_PLL_PARENT_MAIN_XTAL:
  1174						parent_hw = main_xtal_hw;
  1175						break;
  1176					default:
  1177						/* Should not happen. */
  1178						parent_hw = NULL;
  1179						break;
  1180					}
  1181	
  1182					hw = sam9x60_clk_register_frac_pll(regmap,
  1183						&pmc_pll_lock, sama7d65_plls[i][j].n,
  1184						NULL, parent_hw, i,
  1185						sama7d65_plls[i][j].c,
  1186						sama7d65_plls[i][j].l,
  1187						sama7d65_plls[i][j].f);
  1188					break;
  1189	
  1190				case PLL_TYPE_DIV:
  1191					hw = sam9x60_clk_register_div_pll(regmap,
  1192						&pmc_pll_lock, sama7d65_plls[i][j].n,
  1193						NULL, sama7d65_plls[i][0].hw, i,
  1194						sama7d65_plls[i][j].c,
  1195						sama7d65_plls[i][j].l,
  1196						sama7d65_plls[i][j].f,
  1197						sama7d65_plls[i][j].safe_div);
  1198					break;
  1199	
  1200				default:
  1201					continue;
  1202				}
  1203	
  1204				if (IS_ERR(hw))
  1205					goto err_free;
  1206	
  1207				sama7d65_plls[i][j].hw = hw;
  1208				if (sama7d65_plls[i][j].eid)
  1209					sama7d65_pmc->chws[sama7d65_plls[i][j].eid] = hw;
  1210			}
  1211		}
  1212	
  1213		hw = at91_clk_register_master_div(regmap, "mck0", NULL,
  1214						  sama7d65_plls[PLL_ID_CPU][1].hw,
  1215						  &mck0_layout, &mck0_characteristics,
  1216						  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
  1217		if (IS_ERR(hw))
  1218			goto err_free;
  1219	
  1220		sama7d65_pmc->chws[SAMA7D65_PMC_MCK0] = hw;
  1221		sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
  1222	
  1223		parent_hws[0] = md_slck_hw;
  1224		parent_hws[1] = td_slck_hw;
  1225		parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
  1226		for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
  1227			u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
  1228			struct clk_hw *tmp_parent_hws[8];
  1229			u32 *mux_table;
  1230	
  1231			mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
  1232						  GFP_KERNEL);
  1233			if (!mux_table)
  1234				goto err_free;
  1235	
  1236			alloc_mem[alloc_mem_size++] = mux_table;
  1237	
  1238			PMC_INIT_TABLE(mux_table, 3);
  1239			PMC_FILL_TABLE(&mux_table[3], sama7d65_mckx[i].ep_mux_table,
  1240				       sama7d65_mckx[i].ep_count);
  1241			for (j = 0; j < sama7d65_mckx[i].ep_count; j++) {
  1242				u8 pll_id = sama7d65_mckx[i].ep[j].pll_id;
  1243				u8 pll_compid = sama7d65_mckx[i].ep[j].pll_compid;
  1244	
  1245				tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
  1246			}
  1247			PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
  1248				       sama7d65_mckx[i].ep_count);
  1249	
  1250			hw = at91_clk_sama7g5_register_master(regmap, sama7d65_mckx[i].n,
  1251							      num_parents, NULL, parent_hws,
  1252							      mux_table, &pmc_mckX_lock,
  1253							      sama7d65_mckx[i].id,
  1254							      sama7d65_mckx[i].c,
  1255							      sama7d65_mckx[i].ep_chg_id);
  1256	
  1257			if (IS_ERR(hw))
  1258				goto err_free;
  1259	
  1260			sama7d65_mckx[i].hw = hw;
  1261			if (sama7d65_mckx[i].eid)
  1262				sama7d65_pmc->chws[sama7d65_mckx[i].eid] = hw;
  1263		}
  1264	
  1265		parent_names[0] = "syspll_divpmcck";
  1266		parent_names[1] = "usbpll_divpmcck";
  1267		parent_names[2] = "main_osc";
  1268		hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
  1269		if (IS_ERR(hw))
  1270			goto err_free;
  1271	
  1272		parent_hws[0] = md_slck_hw;
  1273		parent_hws[1] = td_slck_hw;
  1274		parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
  1275		parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
  1276		parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
  1277		parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
  1278		parent_hws[6] = sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
  1279		parent_hws[7] = sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
  1280		parent_hws[8] = sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
  1281	
  1282		for (i = 0; i < 8; i++) {
  1283			char name[6];
  1284	
  1285			snprintf(name, sizeof(name), "prog%d", i);
  1286	
  1287			hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
  1288							    9, i,
  1289							    &programmable_layout,
  1290							    sama7d65_prog_mux_table);
  1291			if (IS_ERR(hw))
  1292				goto err_free;
  1293	
  1294			sama7d65_pmc->pchws[i] = hw;
  1295		}
  1296	
  1297		for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
  1298			hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
  1299						      sama7d65_systemck[i].p, NULL,
  1300						      sama7d65_systemck[i].id, 0);
  1301			if (IS_ERR(hw))
  1302				goto err_free;
  1303	
  1304			sama7d65_pmc->shws[sama7d65_systemck[i].id] = hw;
  1305		}
  1306	
  1307		for (i = 0; i < ARRAY_SIZE(sama7d65_periphck); i++) {
  1308			hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
  1309								 &sama7d65_pcr_layout,
  1310								 sama7d65_periphck[i].n,
  1311								 NULL,
  1312								 sama7d65_mckx[sama7d65_periphck[i].p].hw,
  1313								 sama7d65_periphck[i].id,
  1314								 &sama7d65_periphck[i].r,
  1315								 sama7d65_periphck[i].chgp ? 0 :
  1316								 INT_MIN, 0);
  1317			if (IS_ERR(hw))
  1318				goto err_free;
  1319	
  1320			sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
  1321		}
  1322	
  1323		parent_hws[0] = md_slck_hw;
  1324		parent_hws[1] = td_slck_hw;
  1325		parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
  1326		parent_hws[3] = sama7d65_pmc->chws[SAMA7D65_PMC_MCK1];
  1327		for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
  1328			u8 num_parents = 4 + sama7d65_gck[i].pp_count;
  1329			struct clk_hw *tmp_parent_hws[8];
  1330			u32 *mux_table;
  1331	
  1332			mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
  1333						  GFP_KERNEL);
  1334			if (!mux_table)
  1335				goto err_free;
  1336	
  1337			alloc_mem[alloc_mem_size++] = mux_table;
  1338	
  1339			PMC_INIT_TABLE(mux_table, 4);
  1340			PMC_FILL_TABLE(&mux_table[4], sama7d65_gck[i].pp_mux_table,
  1341				       sama7d65_gck[i].pp_count);
  1342			for (j = 0; j < sama7d65_gck[i].pp_count; j++) {
  1343				u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
  1344				u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
  1345	
  1346				tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
  1347			}
  1348			PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
  1349				       sama7d65_gck[i].pp_count);
  1350	
  1351			hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
  1352							 &sama7d65_pcr_layout,
  1353							 sama7d65_gck[i].n, NULL,
  1354							 parent_hws, mux_table,
  1355							 num_parents,
  1356							 sama7d65_gck[i].id,
  1357							 &sama7d65_gck[i].r,
  1358							 sama7d65_gck[i].pp_chg_id);
  1359			if (IS_ERR(hw))
  1360				goto err_free;
  1361	
  1362			sama7d65_pmc->ghws[sama7d65_gck[i].id] = hw;
  1363		}
  1364	
  1365		of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7d65_pmc);
  1366		kfree(alloc_mem);
  1367	
  1368		return;
  1369	
  1370	err_free:
  1371		if (alloc_mem) {
  1372			for (i = 0; i < alloc_mem_size; i++)
  1373				kfree(alloc_mem[i]);
  1374			kfree(alloc_mem);
  1375		}
  1376	
  1377		kfree(sama7d65_pmc);
  1378	}
  1379	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
